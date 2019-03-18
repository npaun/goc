open Golite
open Printf
exception TypeError of string


let typeof node = node._derived
let ast_typeof node = typeof node |> List.hd


let raise_type node lt rt =
	let l0,c0 = node._start in
	let l1,c1 = node._end in 
		raise (TypeError (sprintf "Types %s and %s are incompatible in %s on line %d, cols %d-%d\n" 
			(Dumpast.dump_types lt)
			(Dumpast.dump_types rt)
			"<some node>"
			l0 c0 c1))

(* Performs a very limited resolution strategy which accomodates identifiers like 
   `Type "int" which are still associated with their appropriate basic type like `Int
 *)

let maybe_basic = function
| "int" -> Some `INT
| "float64" -> Some `FLOAT64
| "string" -> Some `STRING
| "rune" -> Some `RUNE
| "bool" -> Some `BOOL
| _ -> None



let typeof_ident symt var = match (Symtbl.get_symbol symt var true) with
| Some sym -> sym.typ
| None -> raise (SyntaxError (sprintf "We are all going to die!!! (%s)" var))

let typeof_var symt var = match (Symtbl.get_symbol symt var true) with
| Some sym -> 
	if sym.kind = Symtbl.VarK || sym.kind = Symtbl.ConstK || sym.kind = Symtbl.FuncK then
		sym.typ
	else
		raise (TypeError (sprintf "%s is not a variable\n" var))
| None -> raise (SyntaxError (sprintf "We are all going to die!!! (%s)" var))

let resolve_basic symt typs =
	let rec aux = function
	| (`Type id) as tref ->
		begin match maybe_basic id with  
		| Some legit_typ -> 
			let alias_typ = List.hd (typeof_ident symt id) in
				if legit_typ = alias_typ
		 		then legit_typ
				else tref
		| None -> tref
		end
	| `TypeLit Slice typ -> `TypeLit (Slice (aux typ))
	| `TypeLit Array(sz, typ) -> `TypeLit (Array(sz, aux typ))
	| `TypeLit Struct(ms) -> `TypeLit(Struct(List.map (fun (i,t) -> (i, aux t)) ms))
	| rest -> rest
	in List.map aux typs

let rt symt typs = 
	let rec aux = function
	| (`Type id) -> List.hd (typeof_ident symt id)
	| `TypeLit Slice typ -> `TypeLit (Slice (aux typ))
	| `TypeLit Array(sz, typ) -> `TypeLit (Array(sz, aux typ))
	| `TypeLit Struct(ms) -> `TypeLit(Struct(List.map (fun (i,t) -> (i, aux t)) ms))
	| rest -> rest
	in typs |> List.map aux |> resolve_basic symt

let infer_auto lt rt = match lt with
| [`AUTO] -> rt
| _ -> lt

let assert_match resolver symt node lt rt = 
	let lt' = infer_auto lt rt in
		if (resolver symt lt') <> (resolver symt rt) then
			raise_type node lt' rt
		

let assert_consist resolver symt ident rhs rt = 
	let inconsistency_error id dectype usedtype = 
		let l0,c0 = rhs._start in
		let l1,c1 = rhs._end in
		sprintf "%s has type %s, but expression %s has type %s at line %d, cols %d-%d\n"
		id
		(Dumpast.dump_types dectype)
		(Pretty.string_of_expr rhs)
		(Dumpast.dump_types usedtype)
		l0 c0 c1
	in match ident.v with
	| `Blank -> () (*Anything goes with blank?*)
	| `V id -> 
		if (resolver symt (typeof_var symt id)) <> (resolver symt rt) then
			raise (TypeError (inconsistency_error id (typeof_var symt id) (resolver symt rt)))
	| _ -> raise (TypeError "Mystery meat callable")

let return_type symt fn = 
	let not_callable_error badtype =
		let l0,c0 = fn._start in
		let l1,c1 = fn._end in
			sprintf "Expression %s of type %s is not callable at line %d, cols %d-%d\n"
			(Pretty.string_of_expr fn)
			(Dumpast.dump_types badtype)
			l0 c0 c1
	in match fn.v with
	| `V id ->
		begin match (Symtbl.get_symbol symt id true) with
		| Some sym ->
			if sym.kind <> Symtbl.FuncK then
				raise (TypeError (not_callable_error (resolve_basic symt sym.typ)))
			else 
				List.hd (resolve_basic symt sym.typ)
		| None -> raise (SyntaxError "Bogus bogus bogus")
		end
  	| other -> raise (TypeError ("Mystery meat callable"))

 

let element_type symt node = 
	let element_type_error () = 
		let l0,c0 = node._start in
		let l1,c1 = node._end in 
			sprintf "Expression %s of type %s (i.e. %s) is not indexable at line %d, cols %d-%d\n"
			(Pretty.string_of_expr node)
			(Dumpast.dump_types (typeof node))
			(Dumpast.dump_types (rt symt (typeof node)))
			l0 c0 c1
	in match (rt symt (typeof node)) with
	| [`TypeLit Slice typ] -> [typ]
	| [`TypeLit Array(sz,typ)] -> [typ]
	| other -> raise (TypeError (element_type_error ()))

let field_type symt node field = 
	let field_not_found_error () = 
		let l0,c0 = node._start in
		let l1,c1 = node._end in 
		
		sprintf "Field %s does not exist in struct %s of type %s at line %d, cols %d-%d\n"
		field
		(Pretty.string_of_expr node)
		(Dumpast.dump_types (typeof node))
		l0 c0 c1
	in let not_a_struct_error () = 
		let l0,c0 = node._start in
		let l1,c1 = node._end in 
		
		sprintf "Expression %s of type %s (i.e. %s) is not selectable at line %d, cols %d-%d\n"
		(Pretty.string_of_expr node)
		(Dumpast.dump_types (typeof node))
		(Dumpast.dump_types (rt symt (typeof node)))
		l0 c0 c1
	in let search_struct typedef field = 
		match List.find_opt (fun (name,typ) -> name = field) typedef with
		| Some (_,typ) -> Some (rt symt [typ])
		| None -> None
	in let structtype = (rt symt (typeof node)) in
		match structtype with
		| [`TypeLit Struct ms] -> 
			begin match search_struct ms field with
			| Some fieldtype -> fieldtype
			| None -> raise (TypeError (field_not_found_error ()))
			end
		| other -> raise (TypeError (not_a_struct_error ()))


let save_inferred_type (sym:Symtbl.symbol) inferred = 
	sym.typ <- inferred

let assert_redef_match symt node lhs rt =
	let redef_error name (lsym:Symtbl.symbol) =
		let lr0,cr0 = node._start in
		let lr1,cr1 = node._end in 
		
		sprintf "Variable %s must not be redeclared as %s on line %d, cols %d-%d. Previously declared as %s."
			name
			(Dumpast.dump_types rt)
			lr0
			cr0
			cr1
			(Dumpast.dump_types lsym.typ)
				
	in let search_conflicts name = 
		match Symtbl.get_symbol symt name true with
		| Some sym -> 
			let lt' = (infer_auto sym.typ rt) in
				if (resolve_basic symt lt') <> (resolve_basic symt rt) then
				raise (TypeError (redef_error name sym))
				else save_inferred_type sym rt
		| None -> ()
	in match lhs.v with
	| `V name -> search_conflicts name
	| `Blank -> ()
	| _ -> raise (TypeError "Weeding failed to remove non-identifier from variable declaration")

let descend = function
| Symtbl.Symt(_,_,children,_) -> List.map (fun r -> !r) children


let same fn nodes child childs =
	match child with
	| Some c -> (fn ())::nodes, c::childs
	| None -> (fn ())::nodes, childs
let down fn nodes child childs = 
	match child with
	| Some c -> (fn c)::nodes, childs
	| None -> raise (TypeError "Fucking symbol table missing a scope")

let traverse fn symt ast = 
	let aux this_symt (nodes,child_symts) node = 
	match child_symts with
	| [] -> fn this_symt node node.v (**) nodes  None [] 
	| h::t -> fn this_symt node node.v (**) nodes (Some h) t
	in let nodes,_= List.fold_left (aux symt) ([], (descend symt)) ast
	in nodes |> List.rev

		



and typeof_literal = function
| Int _ -> `INT
| Float64 _ -> `FLOAT64
| Rune _ -> `RUNE
| String _ -> `STRING
| Bool _ -> `BOOL

let rec pass_ast symt = function
| Program(pkg,tops) -> Program(pkg, traverse pass_toplevel (List.hd (descend symt)) tops)
and pass_toplevel this_symt node  = function
| Global(decl) -> same (fun () -> {node with v = Global(pass_decl this_symt {node with v = decl})})
| Func(name,args,ret,body) -> down (fun child_symt -> {node with v = Func(name,args,ret, pass_block child_symt body)})
and pass_block this_symt body = traverse pass_statement this_symt body
and pass_statement this_symt node = function
| Decl(decls) -> same (fun () -> {node with v = Decl(List.map (fun d -> pass_decl this_symt {node with v = d}) decls)})
| _ -> same (fun () -> node)
and pass_decl symt node = match node.v with
| Var(name, lt, Some expr, s) ->
	let expr' = pass_expr symt expr in
		assert_match resolve_basic symt node [lt] (typeof expr');
		assert_redef_match symt node name (typeof expr');
		Var(name, (ast_typeof expr'), Some expr', s)
| other -> other (* Type declarations are already analyzed by symtbl *)
and pass_expr symt node = match node.v with
| `L lit -> {node with _derived = [typeof_literal lit]}
| `V var -> 
	{node with _derived = typeof_var symt var} 
| `Indexing(arr,idx) -> 
	let arr' = pass_expr symt arr in
	let idx' = pass_expr symt idx in
		let elm_t = element_type symt arr' in
			assert_match rt symt idx' [`INT] (typeof idx');
			{node with v = `Indexing(arr',idx'); _derived = elm_t}
| `Selector(obj,field) ->
	let obj' = pass_expr symt obj in
		let field_t = field_type symt obj' field in
			{node with v = `Selector(obj',field); _derived = field_t}
| `Call(_,_) -> pass_call symt node
| other -> {node with _derived = [`RUNE; `RUNE; `RUNE]} (* This is a really silly type to warn what's going on *)
and pass_call symt node = match node.v with
| `Call({v = `V "append"},[arr;elm]) -> node
| `Call({v = `V "len"} as fnobj,[obj]) -> 
	let obj' = pass_expr symt obj in
		begin try 
			let _ = element_type symt obj' in ()
		with 
		| TypeError _ ->
			assert_match rt symt obj' [`STRING] (typeof obj');
		end;
		{node with v = `Call(fnobj, [obj']); _derived = [`INT]}
| `Call({v = `V "cap"} as fnobj,[obj]) -> 
	let obj' = pass_expr symt obj in
		element_type symt obj';
		{node with v = `Call(fnobj, [obj']); _derived = [`INT]}
| `Call({v = `V "init"},_) -> raise (TypeError "The function init must not be called")
(* todo casts *)
| `Call(fn,args) ->
	let fn' = pass_expr symt fn in
	let args' = List.map (pass_expr symt) args in
	let typeof_args' = List.map typeof args' |> List.flatten in
		let return_t = return_type symt fn' in
			assert_consist resolve_basic symt (fn':expression :> lvalue') node (return_t::typeof_args');
			{node with v = `Call(fn', args'); _derived = [return_t]}

