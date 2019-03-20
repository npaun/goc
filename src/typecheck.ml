open Golite
open Printf
open Typelib

let return_type symt ident = match ident.v with 
	| `V id ->
		assert_kinds symt "function call" id kind_callable;
		List.hd (resolve_basic symt (typeof_symbol symt id))
  	| other -> raise (TypeError ("Mystery meat callable"))

 

let element_type symt node = 
	let element_type_error () = 
		sprintf "Expression %s of type %s (i.e. %s) is not indexable %s\n"
			(Pretty.string_of_expr node)
			(Dumpast.dump_types (typeof node))
			(Dumpast.dump_types (rt symt (typeof node)))
			(err_loc node)
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




let v_name = Pretty.string_of_lvalue'


let rec pass_ast symt = function
| Program(pkg,tops) -> Program(pkg, traverse pass_toplevel (List.hd (descend symt)) tops)
and pass_toplevel this_symt node  = function
| Global(decl) -> same (fun () -> {node with v = Global(decl |> fwd_annot node |> pass_decl this_symt)})
| Func(name,args,ret,body) -> down (fun child_symt -> {node with v = Func(name,args,ret, pass_block child_symt body)})
and pass_block this_symt body = traverse pass_statement this_symt body
and pass_statement this_symt node = function
| Decl(decls) -> same (fun () -> {node with v = Decl(List.map (fun d -> d |> fwd_annot node |> pass_decl this_symt) decls)})
| _ -> same (fun () -> node)
and pass_decl symt node = match node.v with
| Var(name, lt, Some expr, s) ->
	let expr' = pass_expr symt expr in
		assert_match resolve_basic symt "variable declaration" (v_name name, [lt]) (expr, typeof expr');
		assert_redef_match symt node name (typeof expr');
		Var(name, (type_single expr'), Some expr', s)
| other -> other (* Type declarations are already analyzed by symtbl *)
and pass_expr symt node = match node.v with
| `L lit -> {node with _derived = [typeof_literal lit]}
| `V var -> 
	{node with _derived = typeof_symbol symt var} 
| `Indexing(arr,idx) -> 
	let arr' = pass_expr symt arr in
	let idx' = pass_expr symt idx in
		let elm_t = element_type symt arr' in
			assert_match rt symt "indexing" ("<index>", [`INT]) (idx', typeof idx');
			{node with v = `Indexing(arr',idx'); _derived = elm_t}
| `Selector(obj,field) ->
	let obj' = pass_expr symt obj in
		let field_t = field_type symt obj' field in
			{node with v = `Selector(obj',field); _derived = field_t}
| `Call(_,_) -> pass_call symt node
| other -> {node with _derived = [`RUNE; `RUNE; `RUNE]} (* This is a really silly type to warn what's going on *)
and pass_call symt node = match node.v with
| `Call({v = `V "append"},[arr;elm]) -> node
| `Call({v = `V "len"} as fn,[obj]) -> 
	let obj' = pass_expr symt obj in
		begin try 
			let _ = element_type symt obj' in ()
		with 
		| TypeError _ ->
			assert_match rt symt "call to len" ("<argument>",[`STRING]) (obj', typeof obj');
		end;
		{node with v = `Call(fn, [obj']); _derived = [`INT]}
| `Call({v = `V "cap"} as fn,[obj]) -> 
	let obj' = pass_expr symt obj in
		let _ = element_type symt obj' in ();
		{node with v = `Call(fn, [obj']); _derived = [`INT]}
| `Call({v = `V "init"},_) -> raise (TypeError "The function init must not be called")
(* todo casts *)
| `Call(fn,args) ->
	let fn' = pass_expr symt fn in
	let args' = List.map (pass_expr symt) args in
	let typeof_args' = List.map typeof args' |> List.flatten in
		let return_t = return_type symt fn' in
			assert_consist resolve_basic symt fn' (node, (return_t::typeof_args'));
			{node with v = `Call(fn', args'); _derived = [return_t]}
| _ -> failwith "Go away ocaml, not a call"
