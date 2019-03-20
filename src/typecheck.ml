open Golite
open Printf
open Typelib

 
let v_name = Pretty.string_of_lvalue'
let maybe fn = function
| Some arg -> Some (fn arg)
| None -> None

let rec pass_ast symt = function
| Program(pkg,tops) -> Program(pkg, traverse pass_toplevel (List.hd (descend symt)) tops)
and pass_toplevel this_symt node  = function
| Global(decl) -> same (fun () -> {node with v = Global(decl |> fwd_annot node |> pass_decl this_symt)})
| Func(name,args,ret,body) -> down (fun child_symt -> {node with v = Func(name,args,ret, pass_block child_symt body)})
and pass_block this_symt body = traverse pass_statement this_symt body
and pass_inner_stmt symt parent child = 
	(* Sorry for the weird-ass function *)
	(pass_block symt [{parent with v = child}] |> List.hd).v
and pass_statement this_symt node = function
| Decl(decls) -> same (fun () -> {node with v = Decl(List.map (fun d -> d |> fwd_annot node |> pass_decl this_symt) decls)})
| Expr(expr) -> same (fun () -> {node with v = Expr(pass_expr this_symt expr)})
| Return(expr) -> 
	(* match with func return later *)
	same (fun () -> {node with v = Return(maybe (pass_expr this_symt) expr)})
| Block(stmts) -> down (fun child_symt -> {node with v = Block(pass_block child_symt stmts)})
| For(pre,cond,post,block) ->
 	down (fun child_symt -> 
			{node with v = For(
				(maybe (pass_inner_stmt this_symt node) pre),
				(maybe (pass_cond this_symt "for loop") cond),
				(maybe (pass_inner_stmt this_symt node) post),
				pass_block child_symt block
			)})	
| _ -> same (fun () -> node)
and pass_decl symt node = match node.v with
| Var(name, lt, Some expr, s) ->
	let expr' = pass_expr symt expr in
		assert_match resolve_basic symt "variable declaration" (v_name name, [lt]) (expr, typeof expr');
		Typerules.assert_redef_match symt node name (typeof expr');
		Var(name, (type_single expr'), Some expr', s)
| other -> other (* Type declarations are already analyzed by symtbl *)
and pass_cond symt ctx cond = 
	let cond' = pass_expr symt cond in
		assert_match rt symt ctx ("<condition>",[`BOOL]) (cond', typeof cond');
		cond'
and pass_case this_symt node = function
| Case(pre,conds,block) -> (fun child_symt -> 
	{node with v = Case(
		(maybe (pass_inner_stmt this_symt node) pre),
			
| Default(block) -> (fun child_symt -> {node with v = Default(pass_block child_symt block)})

and pass_expr symt node = match node.v with
| `L lit -> {node with _derived = [typeof_literal lit]}
| `V var -> 
	{node with _derived = typeof_symbol symt var} 
| `Indexing(arr,idx) -> 
	let arr' = pass_expr symt arr in
	let idx' = pass_expr symt idx in
		let elm_t = Typerules.element_type symt arr' in
			assert_match rt symt "indexing" ("<index>", [`INT]) (idx', typeof idx');
			{node with v = `Indexing(arr',idx'); _derived = elm_t}
| `Selector(obj,field) ->
	let obj' = pass_expr symt obj in
		let field_t = Typerules.field_type symt obj' field in
			{node with v = `Selector(obj',field); _derived = field_t}
| `Call(_,_) -> pass_call symt node
| other -> {node with _derived = [`RUNE; `RUNE; `RUNE]} (* This is a really silly type to warn what's going on *)
and pass_call symt node = match node.v with
| `Call({v = `V "append"},[arr;elm]) -> node
| `Call({v = `V "len"} as fn,[obj]) -> 
	let obj' = pass_expr symt obj in
		begin try 
			let _ = Typerules.element_type symt obj' in ()
		with 
		| TypeError _ ->
			assert_match rt symt "call to len" ("<argument>",[`STRING]) (obj', typeof obj');
		end;
		{node with v = `Call(fn, [obj']); _derived = [`INT]}
| `Call({v = `V "cap"} as fn,[obj]) -> 
	let obj' = pass_expr symt obj in
		let _ = Typerules.element_type symt obj' in ();
		{node with v = `Call(fn, [obj']); _derived = [`INT]}
| `Call({v = `V "init"},_) -> raise (TypeError "The function init must not be called")
(* todo casts *)
| `Call(fn,args) ->
	let fn' = pass_expr symt fn in
	let args' = List.map (pass_expr symt) args in
	let typeof_args' = List.map typeof args' |> List.flatten in
		let return_t = Typerules.return_type symt fn' in
			assert_consist resolve_basic symt fn' (node, (return_t::typeof_args'));
			{node with v = `Call(fn', args'); _derived = [return_t]}
| _ -> failwith "Go away ocaml, not a call"
