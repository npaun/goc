open Golite
open Typelib

let renamed_type_count = ref 0
let renamed_type_cnt () =
    incr renamed_type_count;
    string_of_int !renamed_type_count
let get_renamed_type name =
  Printf.sprintf "__golite__type_%s_%s" name (renamed_type_cnt ())

let renamed_var_count = ref 0
let renamed_count () =
  incr renamed_var_count;
  string_of_int !renamed_var_count
let get_renamed name =
  Printf.sprintf "__golite__var_%s_%s" name (renamed_count ())

(* map(name, mangled name) * map(type, mangled type) * parent scope *)
type name_tbl = Nametbl of (string, string) Hashtbl.t * (string, string) Hashtbl.t * name_tbl option
    
let make_name_tbl parent =
    Nametbl(Hashtbl.create 500, Hashtbl.create 500, parent)
    
let get_parent = function
    | Nametbl(t, tt, parent) -> parent
    
    
let decl_renamed nametbl name is_var is_short_decl =
    match nametbl with
    | Nametbl(ntbl, ttbl, par) ->
        let found = Hashtbl.find_opt (if is_var then ntbl else ttbl) name in
        match found with
        | None -> 
            if is_var then 
                let new_name = get_renamed name in Hashtbl.add ntbl name new_name; new_name
            else
                let new_name = get_renamed_type name in Hashtbl.add ttbl name new_name; new_name
        | Some n -> if is_short_decl && is_var then let new_name = get_renamed name in Hashtbl.add ntbl name new_name; new_name else raise (Symtbl.SymbolErr "Redeclaration of variable!")
    
let rec rename nametbl name is_var =
    match nametbl with
    | Nametbl(ntbl, ttbl, par) ->
        let found = Hashtbl.find_opt (if is_var then ntbl else ttbl) name in
        match found with
        | Some n -> n
        | None -> (
            match par with
            | Some t -> rename t name is_var
            | None -> name (* we'll see if that's correct *)
        )
        
let rename_var nametbl name = rename nametbl name true        
let rec rename_type nametbl typ = 
    match typ with
    | `Type name -> `Type (rename nametbl name false)        
    | `TypeLit Array (n, t) -> `TypeLit(Array(n, rename_type nametbl t))
    | `TypeLit Slice (t) -> `TypeLit(Slice(rename_type nametbl t))
    | `TypeLit Struct memes -> `TypeLit(Struct (List.map (fun (i, t) -> (i, rename_type nametbl t)) memes)) (* this ain't no typo *)
    | _ -> typ
    
let decl_rename_iden nametbl is_short_decl = function   
    | `Blank -> `Blank
    | `V id -> `V (decl_renamed nametbl id true is_short_decl)
    
let decl_rename_type nametbl = function   
    | `Blank -> `Blank
    | `V id -> `V (decl_renamed nametbl id false false)
    
let rename_sig nametbl (iden, typ) = (decl_rename_iden nametbl false iden, rename_type nametbl typ)
    
let rec pass_ast = function
    | Program(pkg,tops) -> let p' = Program(pkg, List.map (pass_toplevel (make_name_tbl None)) tops) in
		(* printf ">%s<\n" (Dumpast.dump p'); *)
		p'
and pass_toplevel nametbl node = match node.v with
    | Global(decl) -> {node with v = Global(pass_decl nametbl decl)}
    | Func(name,args,ret,body) -> let tbl = make_name_tbl (Some nametbl) in 
        let sign = List.map (rename_sig tbl) args in
        (*Printf.printf "%s" (Pretty.string_of_id name);
        List.iter (fun (iden, typ) -> Printf.printf " %s: %s" (Pretty.string_of_id iden) (Pretty.string_of_typ typ)) sign;
        Printf.printf "\n";*)
        {node with v = Func(name, sign, rename_type nametbl ret, pass_block tbl body)}
and pass_block nametbl body = List.map (pass_statement nametbl) body
and pass_inner_stmt nametbl node = 
	(* Sorry for the weird-ass function *)
	(pass_block nametbl [node] |> List.hd)
and pass_statement nametbl node = match node.v with
    | Decl(decls) -> {node with v = Decl(List.map (pass_decl nametbl) decls)}
    | Expr(expr) -> {node with v = Expr(pass_expr nametbl expr)}
    | Return(expr) -> {node with v = Return(maybe (pass_expr nametbl) expr)}
    | Block(stmts) -> {node with v = Block(pass_block (make_name_tbl (Some nametbl)) stmts)}
    | For(pre,cond,post,block) ->
        let t = make_name_tbl (Some nametbl) in
        let pre' = maybe (pass_inner_stmt t) pre  in
        let cond' = maybe (pass_expr t) cond in
        let post' = maybe (pass_inner_stmt t) post in (* should this run after block' ??? *)
        let block' = pass_block (make_name_tbl (Some t)) block in (* probably buggy af FIXME *)
            {node with v = For(pre',cond',post',block')}
    | If(cases) -> {node with v = If(List.map (pass_case (make_name_tbl (Some nametbl))) cases)}
    | Switch(stmt,cond,cases) ->
        let t = make_name_tbl (Some nametbl) in
        let stmt' = maybe (pass_inner_stmt t) stmt in
        let cond' = (maybe (pass_expr t) cond) in
        let cases' = List.map (pass_fallable_case t) cases in 
            {node with v = Switch(stmt',cond',cases')}
    | Print(ln, exps) -> {node with v = Print(ln, List.map (pass_expr nametbl) exps)}
    | IncDec(arg, op) -> {node with v = IncDec(pass_expr nametbl arg, op)}
    | Assign(assnlst) -> {node with v = Assign(List.map (pass_assn nametbl) assnlst)}
    | OpAssign(lval, op, expr) -> {node with v = OpAssign(pass_expr nametbl lval, op, pass_expr nametbl expr)}
    | _ -> node
and pass_decl nametbl node = match node with
    | Var(name, lt, expropt, s) -> Var(pass_decl_lval nametbl name s, rename_type nametbl lt, pass_expr_opt nametbl expropt, s)
    | Type(name, t) -> Type(decl_rename_type nametbl name, rename_type nametbl t)
    | other -> other (* Type declarations are already analyzed by symtbl *)
and pass_decl_lval nametbl node is_short_decl = match node.v with
    | `Blank -> node
    | `V id -> {node with v = `V (decl_renamed nametbl id true is_short_decl)}
    | _ -> node
and pass_assn nametbl (lval, expr) = (pass_lval nametbl lval), (pass_expr nametbl expr)
and pass_fallable_case nametbl = function
    | (case, mode) -> (pass_case nametbl case, mode)
and pass_case nametbl = function
    | Default(block) -> Default(pass_block (make_name_tbl (Some nametbl)) block)
    | Case(pre,conds,block) -> 
        let pre' = (maybe (pass_inner_stmt nametbl) pre) in
        let conds' = List.map (pass_expr nametbl) conds in
        let block' = pass_block (make_name_tbl (Some nametbl)) block in
        Case(pre',conds',block')
and pass_lval nametbl (node:lvalue') = match node.v with
    | `Blank -> node
    | `V var -> {node with v = `V (rename_var nametbl var)} 
    | `Indexing(arr,idx) -> {node with v = `Indexing(pass_expr nametbl arr, pass_expr nametbl idx)}
    | `Selector(obj,field) -> {node with v = `Selector(pass_expr nametbl obj, field)}
    | _ -> node
and pass_expr_opt nametbl = function
    | Some expr -> Some (pass_expr nametbl expr)
    | None -> None
and pass_expr nametbl node = match node.v with
    | `L lit -> node
    | `V var -> {node with v = `V (rename_var nametbl var)} 
    | `Indexing(arr,idx) -> {node with v = `Indexing(pass_expr nametbl arr, pass_expr nametbl idx)}
    | `Selector(obj,field) -> {node with v = `Selector(pass_expr nametbl obj, field)}
    | `Call(fn, lst) -> {node with v = `Call(fn, List.map (pass_expr nametbl) lst)}
    | `Op1(op, expr) -> {node with v = `Op1(op, pass_expr nametbl expr)}
    | `Op2(op, expr1, expr2) -> {node with v = `Op2(op, pass_expr nametbl expr1, pass_expr nametbl expr2)}
    | `Cast(t, expr) -> {node with v = `Cast(rename_type nametbl t, pass_expr nametbl expr)}
    
