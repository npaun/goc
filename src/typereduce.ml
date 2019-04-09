(* 	Typereduce reduces all _derived types it can find to their most basic defintions. This pass
	is run after typechecking is completed in order to help the Codegen pass determine how each
	value should be represented in C. Further, Typereduce sanity checks all the AST annotations to make sure stuff didn't slip through the cracks in the more complex Typecheck.
*)
open Golite
open Typelib
open Printf

let rec pass_ast symt = function
	| Program (pkg, tops) ->
		let p' = Program(pkg, traverse pass_toplevel (List.hd (descend symt)) tops) in
		printf "%s\n" (Dumpast.dump p');
		p'
and pass_toplevel this_symt node = function
	| Global(decl) -> same (fun () -> {node with v = Global(pass_decl this_symt decl)})
	| Func(name,args,ret,body) -> down (fun child_symt -> 
		{node with v = Func(
			name,
			args,
			(resolve_reduce this_symt [ret] |> List.hd),
			pass_block child_symt body)})
and pass_block this_symt body = traverse pass_statement this_symt body
and pass_inner_stmt symt node = 
	(* Sorry for the weird-ass function *)
	(pass_block symt [node] |> List.hd)
and pass_statement this_symt node = function
	| Decl(decls) -> same (fun () -> {node with v = Decl(List.map (pass_decl this_symt) decls)})
	| Expr(expr) -> same (fun () -> {node with v = Expr(pass_expr this_symt expr)})
	| Return(expr) -> same (fun () -> {node with v = Return(maybe (pass_expr this_symt) expr)})
	| Block(stmts) -> down (fun child_symt -> {node with v = Block(pass_block child_symt stmts)})
	| For(pre,cond,post,block) -> down (fun child_symt -> 
		let pre' =  maybe (pass_inner_stmt child_symt) pre in
		let cond' = maybe (pass_expr child_symt) cond in
		let post' = maybe (pass_inner_stmt child_symt) post in
		let block' = pass_block (List.hd (descend child_symt)) block in
			{node with v = For(pre', cond', post', block')})
	(* TODO: If, Switch fuck it *)
	| Print(ln, exps) -> same (fun () ->
		let exps' = List.map (pass_expr this_symt) exps in
			{node with v = Print(ln, exps')})
	(* TODO: IncDec, Assign, OpAssign *)
	| Break | Continue | Empty -> same (fun () -> node)
and pass_decl symt = function
| Var(name, ltyp, init, shortp) ->
		Var(	name, 
			(resolve_reduce symt [ltyp] |> List.hd),
			(maybe (pass_expr symt) init),
			shortp)
(* TODO:  Type declarations *)
and pass_expr symt node = match node.v with
	| `L _ -> node (* Literals already basic *)
	| `V _ -> reduce symt node (* Lower variable declaration to a basic type if we can *)
	| `Indexing(arr, idx) ->
		let arr' = pass_expr symt arr in
		let idx' = pass_expr symt idx in
		reduce symt {node with v = `Indexing(arr', idx')}
	| `Selector(obj, field) ->
		let obj' = pass_expr symt obj in
			reduce symt {node with v = `Selector(obj', field)}
	| `Call(fn,args) ->
		(* TODO: we will not provide you with the signature of fn, hope that is ok *)
		let args' = List.map (pass_expr symt) args in
		reduce symt {node with v = `Call(fn, args')}
	| `Cast(to_typ, expr) ->
		let expr' = pass_expr symt expr in
		let to_typ' = resolve_reduce symt [to_typ] |> List.hd in
			reduce symt {node with v = `Cast(to_typ', expr')}

	| `Op1(op,a) ->
		let a' = pass_expr symt a in
		reduce symt {node with v = `Op1(op,a')}
	| `Op2(op,a,b) ->
		let a' = pass_expr symt a in
		let b' = pass_expr symt b in
		reduce symt {node with v = `Op2(op,a',b')}
		
