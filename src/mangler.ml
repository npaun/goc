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
	sprintf "%s_%d" ident !sym



(* mangle: Update the symbol table to store a new mangled name, also returning it *)
let mangle symt id = 
	let rename sym =
		let id' = mangled_name id in
			let Symt(defined_in,_,_,_) = Symtbl.get_table_of symt sym in
				Hashtbl.add defined_in id' {sym with typ=[]}; (* insert a redundant definition for the mangled name *)
				sym.mangled <- Some id'; (* save mangled name for us later *)
				id'
	in match Symtbl.get_symbol symt id true with
	| Some sym -> 	begin match sym.mangled with
			| Some name -> name
			| None -> rename sym
			end
	| None -> failwith ("Cannot mangle a non-existent symbol " ^ id)	

let mangle_ident' symt = function
| `V id -> `V (mangle symt id)
| `Blank -> `Blank

let mangle_node symt node = match node.v with
| `V id -> {node with v = `V (mangle symt id)}
| `Blank -> {node with v = `Blank}
| _ -> failwith "die"
let get_symbol_exn symt id =
	match Symtbl.get_symbol symt id true with
	| Some sym -> sym
	| None -> failwith ("Non-existent symbol please die now " ^ id)


let rec nameof symt id =
	let sym = get_symbol_exn symt id in
		if sym.kind = FuncK then
			id (* Functions not subject to mangling *)
		else match sym.mangled with
		| Some name -> name
		| None -> 	(* then the mangled name is in an upper table*)
				let Symt(_,parent,_,_) = symt in
				begin match parent with
				| Some par -> nameof !par id
				| None -> failwith "Symbol has never been mangled. Check if you handled the declaration correctly"
				end

let set_type' symt id typ multiple = 
	let set_once id sym = 
		if sym.typ = [] || multiple then (
			(* printf "ATTENTION: The type of %s has become %s\n"
				id
				(string_of_typesig typ); *)
			sym.typ <- typ)
		else
			() (* Already mangled *)
	in match id with
	| `V id ->
		begin match Symtbl.get_symbol symt id true with
		| Some sym -> set_once id sym
		| None -> failwith ("Cannot set type of nonexistent symbol" ^ id)
		end
	| `Blank -> ()
let set_type symt id typ = set_type' symt id typ false

let update_fun this_symt child_symt id ret args = 
	List.iter (fun (name,typ) -> set_type child_symt name [typ]) args;
	if id = `V "init" then () 
	else (
		let args' = List.map (fun (name,typ) -> typ) args in
		set_type' this_symt id (ret::(distinguish_void args')) true
	)

let mangled_type symt typs = 
	let rec aux = function
	| `Type id -> `Type (nameof symt id)
	| `TypeLit Slice(typ) -> `TypeLit(Slice(aux typ))
	| `TypeLit Array(sz,typ) -> `TypeLit(Array(sz,aux typ))
	| `TypeLit Struct(members) -> 
		let members' = List.map (fun (id,typ) -> (id, aux typ)) members in
		`TypeLit(Struct(members'))
	| other -> other  
	in List.map aux typs


let rec pass_ast symt = function
	| Program (pkg, tops) ->
		let p' = Program(pkg, traverse pass_toplevel (List.hd (descend symt)) tops) in
	(*	printf "%s\n" (Dumpast.dump p'); *)
		p'
and pass_toplevel this_symt node = function
	| Global(decl) -> same (fun () -> {node with v = Global(pass_decl this_symt decl)})
	| Func(name,args,ret,body) -> down (fun child_symt ->
		let argsM = List.map (fun (name,typ) -> (
			(mangle_ident' child_symt name),
			(mangled_type this_symt [typ] |> List.hd))) args
		in let retM = mangled_type this_symt [ret] |> List.hd in
			update_fun this_symt child_symt name retM argsM;
			let body' = pass_block child_symt body in	
				{node with v = Func(name,argsM,retM,body')})
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
		let init' = maybe (pass_expr symt) init in
		let ltypM = mangled_type symt [ltyp] |> List.hd in
		let nameM = mangle_node symt name in
			set_type symt nameM.v [ltypM];
			Var(	nameM, 
				ltypM,
				init',
				shortp)
| Type(name, def) -> 
	let nameM = mangle_ident' symt name in
	let defM = mangled_type symt [def] |> List.hd in
		set_type symt nameM [defM]; 
		Type(nameM, defM)

and pass_fallable_case this_symt node = function
| (case,mode) -> fun nodes -> fun c -> fun children -> (
		let [node'],children' = pass_case this_symt {node with v=case} case [] c children in
			{node with v = (node'.v,mode)}::nodes, children'
	)	
and pass_case this_symt node = function
| Default(block) -> down (fun child_symt -> {node with v = Default(pass_block child_symt block)})
| Case(pre,conds,block) -> down (fun child_symt ->
		let pre' = maybe (pass_inner_stmt this_symt) pre in
		let conds' = List.map (pass_expr this_symt) conds in
		let block' = pass_block child_symt block in
			(* printf "%s\n" (Pretty.string_of_expr (List.hd conds)); *)
			{node with v = Case(pre',conds',block')})
and pass_lval symt node = pass_expr symt node 
and pass_lval' symt node = match node.v with
	| `Blank -> {node with _derived = [`AUTO]} (* FIXME Probably already this way, but let's force it *)
	| #operand as oper ->  (* This is an ordinary expression: convert back and forth *)
		let oper' = (pass_expr symt {node with v = oper}) in 
			{oper' with v = (oper'.v:operand :> lvalinner) }

and pass_expr symt node = match node.v with
	| `L _ -> node 
	| `V id -> {node with v  = `V (nameof symt id)}
	| `Indexing(arr, idx) ->
		let arr' = pass_expr symt arr in
		let idx' = pass_expr symt idx in
		{node with v = `Indexing(arr', idx')}
	| `Selector(obj, field) ->
		let obj' = pass_expr symt obj in
			{node with v = `Selector(obj', field)}
	| `Call({v = `V func} as fn,args) ->
		let args' = List.map (pass_expr symt) args in
			if kindof_symbol symt func = TypeK
				then {node with v = `Call({fn with v = `V (nameof symt func)}, args')} (* Fake cast *)	
				else {node with v = `Call(fn, args')}
	| `Call(_,_) -> node (* This call is bogus, typecheck's gonna get it *)
	| `Op1(op,a) ->
		let a' = pass_expr symt a in
		{node with v = `Op1(op,a')}
	| `Op2(op,a,b) ->
		let a' = pass_expr symt a in
		let b' = pass_expr symt b in
		{node with v = `Op2(op,a',b')}
	| `Cast(_,_) -> failwith "No casting yet"	
