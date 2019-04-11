(* Mangler causes each and every type or variable declaration to have a unique name, averting
   issues with C's behaviour around redeclarations and some design flaws in the symbol table
   and typechecker
*)
open Golite
open Typelib
open Symtbl
open Printf

let sym = ref (-1) 

let mangled_name ident = 
	incr sym;
	sprintf "%s$%d" ident !sym


(* mangle: Update the symbol table to store a new mangled name, also returning it *)
let mangle symt id = 
	match Symtbl.get_symbol symt id true with
	| Some sym ->
		sym.mangled <- Some (mangled_name id);
		sym.mangled
	| None -> failwith "Cannot mangle a non-existent symbol"	


let get_symbol_exn symt id =
	match Symtbl.get_symbol symt id true with
	| Some sym -> sym
	| None -> failwith "Non-existent symbol please die now"

let rec nameof symt id =
	let sym = get_symbol_exn symt id in
		match sym.mangled with
		| Some name -> name
		| None -> 	(* then the mangled name is in an upper table*)
				let Symt(_,parent,_,_) = symt in
				begin match parent with
				| Some par -> nameof !par id
				| None -> failwith "Symbol has never been mangled. Check if you handled the declaration correctly"
				end

let do_nothing symt typ = typ
let ignore_node symt node = node

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
			(List.map (fun (name,typ) -> name,(do_nothing this_symt [typ] |> List.hd)) args),
			(do_nothing this_symt [ret] |> List.hd),
			pass_block child_symt body)})
and pass_block this_symt body = traverse pass_statement this_symt body
and pass_inner_stmt symt node = 
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
	| If(cases) -> down (fun child_symt ->
		{node with v = If(packify pass_case child_symt cases)})
	| Switch(pre,cond,cases) -> down (fun child_symt ->
		let pre' = maybe (pass_inner_stmt child_symt) pre in
		let cond' = maybe (pass_expr child_symt) cond in
		let cases' = packify pass_fallable_case child_symt cases in
		{node with v = Switch(pre',cond',cases')})
	| Print(ln, exps) -> same (fun () ->
		let exps' = List.map (pass_expr this_symt) exps in
			{node with v = Print(ln, exps')})
	| IncDec(expr, op) -> same (fun () -> 
		let expr' = pass_expr this_symt expr in
			{node with v = IncDec(expr', op)})
	| Assign(assments) -> same (fun () ->
		let assments' = List.map (fun (lhs, rhs) -> 
				(pass_lval' this_symt lhs, pass_expr this_symt rhs)
			) assments in
			{node with v = Assign(assments')})
	| OpAssign(lval,op,expr) -> same (fun () ->
		let lval' = pass_lval this_symt lval in
		let expr' = pass_expr this_symt expr in
			{node with v = OpAssign(lval',op,expr')}
	)
	| Break | Continue | Empty -> same (fun () -> node)
and pass_decl symt = function
| Var(name, ltyp, init, shortp) ->
		Var(	name, 
			(do_nothing symt [ltyp] |> List.hd),
			(maybe (pass_expr symt) init),
			shortp)
| Type(name, def) -> Type(name, do_nothing symt [def] |> List.hd)
and pass_fallable_case this_symt node = function
| (case,mode) -> same (fun () -> {node with v = (packify pass_case this_symt [case] |> List.hd, mode)}) (* It is best not to ask *)
and pass_case this_symt node = function
| Default(block) -> down (fun child_symt -> {node with v = Default(pass_block child_symt block)})
| Case(pre,conds,block) -> down (fun child_symt ->
		let pre' = maybe (pass_inner_stmt this_symt) pre in
		let conds' = List.map (pass_expr this_symt) conds in
		let block' = pass_block child_symt block in
			{node with v = Case(pre',conds',block')})
and pass_lval symt node = pass_expr symt node 
and pass_lval' symt node = match node.v with
	| `Blank -> {node with _derived = [`AUTO]} (* FIXME Probably already this way, but let's force it *)
	| #operand as oper ->  (* This is an ordinary expression: convert back and forth *)
		let oper' = (pass_expr symt {node with v = oper}) in 
			{oper' with v = (oper'.v:operand :> lvalinner) }

and pass_expr symt node = match node.v with
	| `L _ -> node 
	| `V _ -> node
	| `Indexing(arr, idx) ->
		let arr' = pass_expr symt arr in
		let idx' = pass_expr symt idx in
		ignore_node symt {node with v = `Indexing(arr', idx')}
	| `Selector(obj, field) ->
		let obj' = pass_expr symt obj in
			ignore_node symt {node with v = `Selector(obj', field)}
	| `Call(fn,args) ->
		(* TODO: we will not provide you with the signature of fn, hope that is ok *)
		let args' = List.map (pass_expr symt) args in
		ignore_node symt {node with v = `Call(fn, args')}
	| `Op1(op,a) ->
		let a' = pass_expr symt a in
		ignore_node symt {node with v = `Op1(op,a')}
	| `Op2(op,a,b) ->
		let a' = pass_expr symt a in
		let b' = pass_expr symt b in
		ignore_node symt {node with v = `Op2(op,a',b')}
	| `Cast(_,_) -> failwith "No casting yet"	
