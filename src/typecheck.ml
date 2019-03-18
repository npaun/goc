open Golite
open Printf
exception TypeError of string


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

let infer_auto lt rt = match lt with
| [`AUTO] -> rt
| _ -> lt

let assert_match symt node lt rt = 
	let lt' = infer_auto lt rt in
		if (resolve_basic symt lt') <> (resolve_basic symt rt) then
			raise_type node lt' rt
		

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
			raise (TypeError (redef_error name sym));
			let lt' = sym.typ in
				if (resolve_basic symt lt') <> (resolve_basic symt rt) then
				raise (TypeError (redef_error name sym))
		| None -> ()
	in match lhs.v with
	| `V name -> search_conflicts name
	| `Blank -> ()
	| _ -> raise (TypeError "Weeding failed to remove non-identifier from variable declaration")

let descend = function
| Symtbl.Symt(_,_,children,_) -> List.map (fun r -> !r) children

let travesor sym0 sym1s node fn =
	let down = 
		match sym1s with
		| h::t -> (traversoru
let typeof node = node._derived
let ast_typeof node = typeof node |> List.hd

let rec pass_ast symt = function
| Program(pkg,tops) -> 
	let top_symt = (List.hd (descend symt)) in
		 Program(pkg, pass_toplevels (descend top_symt) top_symt tops)
and pass_toplevels child_symts top_symt tops =
	let (tops',_) = List.fold_right (fun top (tops,child_symts) -> (pass_toplevel top_symt child_symts top)::tops) tops ([],child_symts)
	in tops'
and pass_toplevel sym0 syms1 node =
	let node', syms1' = match node.v with
	| Global decl -> (Global(pass_decl sym0 {node with v = decl}), syms1)
	| Func(name,args,ret,body) -> 
		match syms1 with
		| h::t -> (Func(name,args,ret, pass_block h body), t)
		| [] -> raise (TypeError "Unable to find a child symbol table")
	in ({node with v = node'}, syms1')
and pass_block symt body = List.map (pass_stmt symt) body
and pass_stmt symt node = match node.v with
| Decl(decls) -> {node with v = Decl(List.map (fun d -> pass_decl symt {node with v = d}) decls)}
| _ -> node
and pass_decl symt node = match node.v with
| Var(name, lt, Some expr, s) ->
	let expr' = pass_expr symt expr in
		assert_match symt node [lt] (typeof expr');
		assert_redef_match symt node name (typeof expr');
		Var(name, (ast_typeof expr'), Some expr', s)
| other -> other (* Type declarations are already analyzed by symtbl *)
and pass_expr symt node = match node.v with
| `L lit -> {node with _derived = [typeof_literal lit]}
| `V var -> {node with _derived = typeof_ident symt var} 
and typeof_literal = function
| Int _ -> `INT
| Float64 _ -> `FLOAT64
| Rune _ -> `RUNE
| String _ -> `STRING
| Bool _ -> `BOOL
