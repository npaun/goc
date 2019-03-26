open Golite
open Printf
open Typelib
 
let v_name = Pretty.string_of_lvalue'
let maybe fn = function
    | Some arg -> Some (fn arg)
    | None -> None
let present = function
    | Some _ -> true
    | None -> false

let default fn if_none = function
    | Some arg -> (fn arg)
    | None -> if_none

let packify fn symt nodes =
	List.map (fun n -> {v = n; _derived = []; _start = (-100,-100); _end = (-100,-100); _debug = "Packified"}) nodes
	|> traverse fn symt
	|> List.map (fun n -> n.v)

(* This function performs two operations:
    1) it ensures that the return types in a function match the functions return type
    2) it ensures that if the function is not void, then it ends with a terminating statement
       as defined by the golang spec: https://golang.org/ref/spec#Terminating_statements
*)
let func_ret_check ret symt block =
	let return_count = ref 0 in
	let block_visitor stmt = match stmt.v with
		| Return(expr_opt) -> (
			match expr_opt with
				| Some e -> assert_match resolve_basic symt "return statement" ("<func>", [ret]) (e, e._derived); return_count := !return_count + 1; stmt
				| None -> (match ret with
					| `VOID -> return_count := !return_count + 1; stmt
					| _ ->
						let (line, ch) = stmt._start in
						let msg = sprintf "Empty return statement given when function has return type (%s) at line %d, cols %d\n"
						(string_of_typesig [ret]) line ch in
						raise (TypeError msg)
				)
		)
		| _ -> stmt
    in
    let term_error start xmsg = 
        let (line, ch) = start in
        let msg = sprintf "non-void function does not end with terminating statement at line %d chr %d - %s"
        line ch xmsg in
        raise (TypeError msg)
    in
    let no_break xmsg stmt = match stmt.v with
        | Break -> term_error stmt._start (sprintf "%s contains break statement" xmsg)
        | _ -> ()
    in
    let fcase_no_break fcase = match fcase with
    | Case(_,_,block),_ -> List.iter (no_break "switch statement") block
    | Default(block),_ -> List.iter (no_break "switch statement") block
    in
    let rec stmt_is_term stmt = match stmt.v with
        | Return(expr_opt) -> () (* types are checked in above func *)
        | If(cases) -> (match List.hd (List.rev cases) with 
            | Case(_, _, _) -> term_error stmt._start "if statement doesn't have an else branch"
            | Default(else_block) -> List.iter (case_is_term stmt._start) cases (* TODO line info here is technically wrong *)
        )
        | Switch(_, _, fcases) ->(
            if (List.length fcases) == 0 then term_error stmt._start "switch statement doesn't have a default case"
            else
                let is_default = function
                    | Case(_,_,_),_ -> false
                    | Default(_),_ -> true
                in match List.exists is_default fcases with
                    | true -> List.iter fcase_no_break fcases; List.iter (fcase_is_term stmt._start) fcases
                    | false -> term_error stmt._start "switch statement doesn't have a default case"
        )
        | For(_, expr_opt, _, block) -> (match expr_opt with
            | Some expr -> term_error stmt._start "for loop contains loop condition"
            | None -> List.iter (no_break "for loop") block
        )
        | Block(_blk) -> final_is_term stmt._start _blk
        | _ -> term_error stmt._start ""
    and fcase_is_term start fcase = match fcase with
        | case,FALLTHROUGH -> ()
        | case,ENDBREAK -> case_is_term start case
    and case_is_term start case = match case with
        | Case(_, _, block) -> final_is_term start block
        | Default(block) -> final_is_term start block
	and final_is_term start blk = match blk with 
        | [] -> term_error start "no return statement given to non-void function" 
        | _ -> stmt_is_term (List.hd (List.rev blk))
	in
	let blck = List.map block_visitor block in
    match ret with
        | `VOID -> blck
        | _ -> final_is_term (-1,1) blck; blck (* TODO get line info for this case *)


let rec pass_ast symt = function
    | Program(pkg,tops) -> let p' = Program(pkg, traverse pass_toplevel (List.hd (descend symt)) tops) in
		(* printf ">%s<\n" (Dumpast.dump p'); *)
		p'
and pass_toplevel this_symt node  = function
    | Global(decl) -> same (fun () -> {node with v = Global(decl |> fwd_annot node |> pass_decl this_symt)})
    | Func(name,args,ret,body) -> down (fun child_symt -> {node with v = Func(name,args,ret, pass_block child_symt body |> func_ret_check ret child_symt )})
and pass_block this_symt body = traverse pass_statement this_symt body
and pass_inner_stmt symt node = 
	(* Sorry for the weird-ass function *)
	(pass_block symt [node] |> List.hd)
and pass_statement this_symt node = function
| Decl(decls) -> same (fun () -> {node with v = Decl(List.map (fun d -> d |> fwd_annot node |> pass_decl this_symt) decls)})
| Expr(expr) -> same (fun () -> {node with v = Expr(pass_expr this_symt expr)})
| Return(expr) -> 
	same (fun () -> {node with v = Return(maybe (pass_expr this_symt) expr)})
| Block(stmts) -> down (fun child_symt -> {node with v = Block(pass_block child_symt stmts)})
| For(pre,cond,post,block) -> down (fun child_symt -> 
			let pre' = maybe (pass_inner_stmt child_symt) pre  in
			let cond' = maybe (pass_cond child_symt "for loop") cond in
			let post' = maybe (pass_inner_stmt child_symt) post in (* should this run after block' ??? *)
			let block' = pass_block (List.hd (descend child_symt)) block in (* probably buggy af FIXME *)
				{node with v = For(pre',cond',post',block')}
	)
| If(cases) -> down (fun child_symt -> 
	{node with v = If(packify (pass_case "if condition" [`BOOL]) child_symt cases)})
| Switch(stmt,cond,cases) -> down (fun child_symt ->
		let stmt' = maybe (pass_inner_stmt child_symt) stmt in
		let cond' = (maybe (pass_expr child_symt) cond) in
		let cond_t = (default typeof [`BOOL] cond') in
		let cases' = packify (pass_fallable_case "switch case" cond_t) child_symt cases in 
			{node with v = Switch(stmt',cond',cases')}
		)
| Print(ln, exps) -> same (fun () ->
	let exps' = List.map (pass_expr this_symt) exps in
		List.iter (fun exp' -> assert_resolves_to_base this_symt "print statement" (typeof exp') exp') exps';
		{node with v = Print(ln, exps')}
	)
| IncDec(arg, op) -> same (fun () ->
	let arg' = pass_expr this_symt arg in
		assert_is_numeric this_symt "increment or decrement statement" (typeof arg') arg';
		{node with v = IncDec(arg', op)}
	)
| Assign(assnlst) -> same (fun () -> {node with v = Assign(List.map (fun assn -> pass_assn this_symt assn) assnlst)})
| _ -> same (fun () -> node)
and pass_decl symt node = match node.v with
    | Var(name, lt, Some expr, s) ->
        let expr' = pass_expr symt expr in
        let lt' = infer_auto [lt] (typeof expr') in
        assert_match resolve_basic symt "variable declaration" (v_name name, lt') (expr, typeof expr');
        Typerules.assert_redef_match symt node name (typeof expr');
        Var(name, (type_single expr'), Some expr', s)
    | other -> other (* Type declarations are already analyzed by symtbl *)
and pass_assn symt (lval, expr) = match (lval.v, expr.v) with
    | (`Blank, oper)
    | (`Indexing(_,_), oper)
    | (`Selector(_,_), oper)
    | (`V _, oper) -> (
        let lval' = pass_lval symt lval in
        let expr' = pass_expr symt expr in
        assert_match resolve_basic symt "assignment" ("<lvalue>", typeof lval') (expr', typeof expr');
        (lval', expr')
    )
    | _ -> failwith "non-lvalue expression on lhs of assignment"
and pass_fallable_case ctx expected_t this_symt node = function
    | (case, mode) -> same (fun () -> {node with v = ((packify (pass_case ctx expected_t) this_symt [case] |> List.hd), mode)})
and pass_case ctx expected_t this_symt node = function
    | Default(block) -> down (fun child_symt -> {node with v = Default(pass_block child_symt block)})
    | Case(pre,conds,block) -> 
        down (fun child_symt ->
        let pre' = (maybe (pass_inner_stmt this_symt) pre) in
        let conds' = List.map (pass_expr this_symt) conds in
	let block' = pass_block child_symt block in
            List.iter (fun cond' -> 
                assert_match rt this_symt ctx ("<condition>",expected_t) (cond', typeof cond')
            ) conds';
            {node with v = Case(pre',conds',block')}
        )
and pass_cond symt ctx cond = 
	let cond' = pass_expr symt cond in
		assert_match rt symt ctx ("<condition>",[`BOOL]) (cond', typeof cond');
		cond'
and pass_lval symt node = match node.v with
    | `Blank -> {node with v = `Blank; _derived = [`AUTO]}
    | `V var -> {node with _derived = typeof_symbol symt var} 
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
    | _ -> failwith "non-value used on lhs of assignment, weeder failed"
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
    | `Op1(_,_) -> pass_op1 symt node
    | `Op2(_,_,_) -> pass_op2 symt node
and pass_call symt node = match node.v with
    | `Call({v = `V "append"} as fn,[arr;elm]) -> 
        (* TODO: hard to tell this actually works without finishing pass_expr, test later *)
        let arr' = pass_expr symt arr in
        let elm' = pass_expr symt elm in
        let elmtyp = Typerules.slice_type symt arr' in
        assert_match resolve_basic symt "call to append" ("<slice>", elmtyp) (elm', typeof elm');
        {node with v = `Call(fn, [arr';elm']); _derived = typeof arr'}
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
    | `Call({v = `V ident} as fn, args) ->
        (* check if symbol kind is Symtbl.TypeK *)
        (* if so, pass_cast instead *)    
        if is_type_kind symt ident then
            pass_cast symt node
        else
            let fn' = pass_expr symt fn in
            let args' = List.map (pass_expr symt) args in
            let typeof_args' = List.map typeof args' |> List.flatten in
                let return_t = Typerules.return_type symt fn' in
                    assert_consist resolve_basic symt fn' (node, (return_t::typeof_args'));
                    {node with v = `Call(fn', args'); _derived = [return_t]}
    | _ -> raise (TypeError (sprintf "Expression '%s' cannot yield a callable value %s" (Pretty.string_of_expr node) (err_loc node)))
and pass_cast symt node = 
    let bad_cast msg = let (line, col) = node._start in
        raise (SyntaxError ("in cast expression at line " ^ string_of_int line ^ ", char " ^ string_of_int col ^ ", " ^ msg))
    in 
    match node.v with
    (* might aswell use our cast node *)
    | `Call({v = `V ident} as typ, [obj]) ->
        let dest_typ = typeof_symbol symt ident in
        let obj' = pass_expr symt obj in
        begin try (
            assert_resolves_to_base symt "cast expression" dest_typ typ;
            assert_is_numeric symt "cast expression" dest_typ typ;
            assert_is_numeric symt "cast expression" (typeof obj') node;
        )
        with 
        | TypeError _ -> (
            assert_resolves_to_base symt "cast expression" dest_typ typ;
            try
                assert_match rt symt "cast expression" ("<cast>", dest_typ) (node, typeof obj');
            with
            | TypeError _ -> (
                assert_match rt symt "cast expression" ("string", [`STRING]) (typ, dest_typ);
                assert_is_integral symt "cast expression" (typeof obj') node;
            )
        )
        end;
        {node with v = `Cast(List.hd dest_typ, obj'); _derived = dest_typ}
    | `Call(_, lst) -> (match lst with 
        | [] -> bad_cast "expected expression"
        | h::h'::t -> bad_cast "only one expression can be cast"
    )
and pass_op1 symt node =
	let op1_assertion = function
	| `POS -> (fun n -> assert_is_numeric symt "unary +" (typeof n) n)
	| `NEG -> (fun n -> assert_is_numeric symt "unary -" (typeof n) n)
	| `NOT -> (fun n -> assert_match rt symt "negation (!)" ("<operand>", [`BOOL]) (n, typeof n))
	| `BNOT -> (fun n -> assert_is_integral symt "bitwise negation" (typeof n) n)
	in match node.v with
	| `Op1(op,a) ->
		let a' = pass_expr symt a in
			op1_assertion op a';
			{node with v = `Op1(op,a'); _derived = (typeof a')}
	| _ -> failwith "Go away ocaml, not an op1" 
and pass_op2 symt node = 
	let monotype = function
	| `OR | `AND -> Some [`BOOL]
	| `MOD | `BOR | `BAND | `SL | `SR | `BANDNOT | `BXOR -> Some [`INT]
	| _ -> None
	in match node.v with
	| `Op2(op,a,b) when present (monotype op) -> 
		let Some op_t = monotype op in
		let a' = pass_expr symt a in
		let b' = pass_expr symt b in
			assert_match rt symt (Pretty.string_of_op2 op) ("<left operand>", op_t) (a', typeof a');
			assert_match rt symt (Pretty.string_of_op2 op) ("<right operand>", op_t) (b', typeof b');
			{node with v = `Op2(op,a',b'); _derived = op_t}
	| `Op2(`ADD,a,b) -> {node with _derived = [`VOID]} (* string, etc. *)
	| rest -> {node with _derived = [`VOID]} (* numeric, comparable, ordered operations *)
