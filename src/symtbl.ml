open Golite

exception SymbolErr of string
exception SymbolInvInputErr of string
exception SymbolUndefinedErr of string
    
(* handle user-defined types as a symbol and lookup the table when a type is used? *)
type symbolkind = VarK | TypeK | FuncK (* other kinds? *)

(* the point here is to get the annotation for position info *)
type astnode = Topnode of toplevel_declaration annotated | Stmtnode of statement | Exprnode of expression (* add more? *)

(* Any other relevant field? *)
type symbol = {
    mutable name : string; (* or identifier'? *)
    mutable kind : symbolkind;
    mutable typ  : gotype;
    mutable node : astnode;
}

let get_pos sym = match sym.node with
    | Stmtnode node -> node._start
    | Exprnode node -> node._start

(* TODO - add position information (line, char) *)
let symbol_error sym =
    let line, chr = get_pos sym in
    let msg = "At line: " ^ string_of_int line ^ " char: " ^ string_of_int chr ^ ", " ^
    (match sym.kind with
    | VarK -> "variable " ^ sym.name
    | TypeK -> "type " ^ sym.name (* or typ *)
    ) ^ " is already defined in this scope!"
    in raise (SymbolErr (msg))

let symbol_invalid_input_error start m = 
    let line, chr = start in
    let msg = "At line: " ^ string_of_int line ^ " char: " ^ string_of_int chr ^ ", " ^ m in
    raise (SymbolInvInputErr (msg))

let symbol_undefined_error start id =
    let line, chr = start in
    let msg = "At line: " ^ string_of_int line ^ " char: " ^ string_of_int chr ^ ", use of undefined identifier " ^ id in
    raise (SymbolUndefinedErr (msg)) 

    
(* string -> symbolkind -> gotype -> astnode -> symbol *)    
let make_symbol n k t a = {
    name = n; kind = k; typ = t; node = a
}

(* hashtbl(name, sym) * parent (optional) * children *)
type symtbl = Symt of (string, symbol) Hashtbl.t * (symtbl ref) option * symtbl list

(* unit -> symtbl *)
(* used to create a table without a parent *)
let init_tbl = Symt(Hashtbl.create 500, None, [])

(* symtbl -> symtbl *)
let make_tbl parent = Symt(Hashtbl.create 500, Some (ref parent), [])

(* symtbl -> symtbl ref option *)
let get_parent tbl = match tbl with
| Symt(_, parent, _) -> parent

(* symtbl -> symtbl -> symtbl *)
(* Adds tbl2 to tbl1's children *)
let add_child tbl1 tbl2 = match tbl1 with
    | Symt(tbl, parent, children) -> Symt(tbl, parent, children @ [tbl2])

(* symtbl -> string -> symbol option *)
(* searches through the current scope, then through parent scopes until global (no parents left) *)
let rec get_symbol tbl name = match tbl with
    | Symt(table, parent, _) ->
        let found = Hashtbl.find_opt table name in
        match found with
        | Some s -> found
        | None -> (
            match parent with
            | Some p -> get_symbol !p name
            | None -> None
        )

(* symbol -> symtbl -> unit *)
let put_symbol tbl sym = 
    match tbl with
    | Symt(table, _, _) -> 
        match get_symbol tbl sym.name with
        | None -> Hashtbl.add table sym.name sym
        | Some s -> symbol_error sym

(* symtbl -> symtbl *)        
(* makes new table with arg as parent, adds it to the parent's children and returns it *)        
let scope_tbl parent = 
    let newtbl = make_tbl parent in
    let _ = add_child parent newtbl in
    newtbl

(* identifier' -> symbolkind -> gotype -> astnode -> symtbl *)
(* puts an indentifier' into the given symtbl *)
let put_iden iden' kind typ node symtbl = match iden' with
    | `V(id) -> put_symbol symtbl (make_symbol id kind typ node);
    | `Blank -> ()

(* TODO: missing sym_stmt cases, sym_expr, sym_case *)
let rec sym_ast ast symtbl = match ast with
    | Program(pkg, toplvllist) -> List.iter (fun t -> (sym_toplvl t symtbl)) toplvllist
and sym_toplvl toplvl symtbl = match toplvl.v with
    | Global(decl) -> sym_decl (Topnode(toplvl)) toplvl._start symtbl decl
    | Func(iden', siglst, typ, block) -> (
        put_iden iden' FuncK typ (Topnode(toplvl)) symtbl;
        let csymtbl = scope_tbl symtbl in
        sym_siglist toplvl siglst csymtbl;
        sym_block block csymtbl;
    )
and sym_siglist toplvl siglist symtbl = List.iter (fun (id, typ) -> put_symbol symtbl (make_symbol id VarK typ (Topnode(toplvl)))) siglist
and sym_block block symtbl = List.iter (sym_stmt symtbl) block
and sym_stmt symtbl stmt = match stmt.v with
    | Decl(decllst) -> List.iter (sym_decl (Stmtnode(stmt)) stmt._start symtbl) decllst
    | Expr(expr) -> sym_expr symtbl expr
    | Block(block) -> sym_block block (scope_tbl symtbl)
    | Assign(alist) -> () (* TODO *)
    | OpAssign(lvalue, _, expr) -> () (* TODO *)
    | IncDec(expr, _) -> sym_expr symtbl expr
    | Print(_, exprlist) -> List.iter (sym_expr symtbl) exprlist
    | Return (expr_opt) -> sym_expr_opt symtbl expr_opt
    | If(clist) -> () (* List.iter (sym_case symtbl) clist *) (* TODO *)
    | Switch(stmt, expr_opt, fclist) -> ()
    | For(stmt_opt, expr_opt, stmt_opt2, block) -> ()
    | Break
    | Continue
    | Empty -> ()
and sym_case symtbl case = match case with
    | Case(stmt, exprlist, block) -> () (* TODO *) (* NOTE: we cannot simply call sym_block here because the stmt adds entries into the block's scope *)
    | Default(block)              -> sym_block block symtbl
and sym_decl node s symtbl decl = match decl with
    | Var(lhs, typ, _, _) -> (match lhs.v with
        | `V(id) -> put_symbol symtbl (make_symbol id VarK typ node)
        | _      -> symbol_invalid_input_error s "invalid lhs given in declaration - can only be identifier"
    )
    | Type(iden', typ) -> put_iden iden' TypeK typ node symtbl
and sym_expr symtbl expr = match expr.v with
    | `Op1(op1,exp)        -> sym_expr symtbl exp
    | `Op2(op2, exp, exp2) -> sym_expr symtbl exp; sym_expr symtbl exp2 
    | `Call(exp, explist)  -> sym_expr symtbl exp; List.iter (sym_expr symtbl) explist
    | `Cast(typ, exp)      -> sym_expr symtbl exp
    | `Selector(exp, id)   -> () (* TODO *)
    | `L(lit)              -> ()
    | `Indexing(exp,exp2)  -> sym_expr symtbl exp; sym_expr symtbl exp2
    | `V(id)               -> (match (get_symbol symtbl id) with 
        | Some s -> ()
        | None   -> symbol_undefined_error expr._start id
    )
and sym_expr_opt symtbl expr_opt = match expr_opt with
    | Some e -> sym_expr symtbl e
    | None   -> ()



