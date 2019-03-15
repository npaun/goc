open Golite

exception SymbolErr of string
exception SymbolInvInputErr of string
exception SymbolUndefinedErr of string

let print_sym = ref false

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
    
(* hashtbl(name, sym) * parent (optional) * children * depth *)
type symtbl = Symt of (string, symbol) Hashtbl.t * (symtbl ref) option * symtbl list * int

let rec print_symbol sym tbl = 
    let Symt(_,_,_,depth) = tbl in
    Printf.printf "%s%s [%s] = %s\n" (String.make depth '\t') sym.name (string_of_kind sym.kind) (string_of_typ sym.typ)
and string_of_kind kind = match kind with 
    | VarK  -> "variable"
    | TypeK -> "type"
    | FuncK -> "function"
and string_of_typ typ = match typ with
    | `BOOL         -> "bool"
    | `RUNE         -> "char"
    | `INT          -> "int"
    | `FLOAT64      -> "float64"
    | `STRING       -> "string"
    | `Type(id)     -> id
    | `AUTO | `VOID -> ""
    | `TypeLit(t)   -> string_of_typlit t
(* had to copy this from pretty.ml due to differences with struct printing *)
and string_of_typlit typlit = match typlit with
    | Slice(typ)    -> "[]" ^ string_of_typ typ 
    | Array(i, typ) -> "[" ^ string_of_int i ^ "]" ^ string_of_typ typ
    | Struct(mems)  -> "struct { " ^ (string_of_sigs mems "; ") ^ " }"
and string_of_sigs sigs sep = 
    let string_of_sig = function
        | (id, typ) -> id ^ " " ^ string_of_typ typ 
    in
    String.concat sep (List.map string_of_sig sigs)

let get_pos sym = match sym.node with
    | Stmtnode node -> node._start
    | Exprnode node -> node._start
    | Topnode node -> node._start

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


(* unit -> symtbl *)
(* used to create a table without a parent *)
let init_tbl = Symt(Hashtbl.create 500, None, [], 0)

(* symtbl -> symtbl *)
let make_tbl parent = 
    let Symt(_, _, _, d) = parent in
    Symt(Hashtbl.create 500, Some (ref parent), [], d + 1)

(* symtbl -> symtbl ref option *)
let get_parent tbl = match tbl with
| Symt(_, parent, _, _) -> parent

(* symtbl -> symtbl -> symtbl *)
(* Adds tbl2 to tbl1's children *)
let add_child tbl1 tbl2 = match tbl1 with
    | Symt(tbl, parent, children, d) -> Symt(tbl, parent, children @ [tbl2], d)

(* symtbl -> string -> symbol option -> bool*)
(* searches through the current scope, then through parent scopes until global (no parents left) *)
(* rc bool param controls if we recursive up to the parent symtbl's *)
let rec get_symbol tbl name rc = match tbl with
    | Symt(table, parent, _, _) ->
        let found = Hashtbl.find_opt table name in
        match found, rc with
        | Some s, _   -> found
        | None, false -> None
        | None, true  -> (
            match parent with
            | Some p -> get_symbol !p name true
            | None -> None
        )

(* symbol -> symtbl -> unit *)
let put_symbol tbl sym = 
    match tbl with
    | Symt(table, _, _, _) -> 
        match get_symbol tbl sym.name false with
        | None -> Hashtbl.add table sym.name sym; if !print_sym then print_symbol sym tbl
        | Some s -> symbol_error sym

(* symtbl -> symtbl *)        
(* makes new table with arg as parent, adds it to the parent's children and returns it *)        
let scope_tbl parent = 
    let newtbl = make_tbl parent in
    let _ = add_child parent newtbl in
    newtbl

(* identifier' -> symbolkind -> gotype -> astnode -> symtbl -> unit *)
(* puts an indentifier' into the given symtbl *)
let put_iden iden' kind typ node symtbl = match iden' with
    | `V(id) -> put_symbol symtbl (make_symbol id kind typ node);
    | `Blank -> ()

(* TODO: implement missing entries below, add checking for types *)
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
and sym_block block symtbl =
    let Symt(_,_,_,d) = symtbl in
    Printf.printf "%s{\n" (String.make (d-1) '\t');
    List.iter (sym_stmt symtbl) block;
    Printf.printf "%s}\n" (String.make (d-1) '\t')
and sym_stmt symtbl stmt = match stmt.v with
    | Decl(decllst) -> List.iter (sym_decl (Stmtnode(stmt)) stmt._start symtbl) decllst
    | Expr(expr) -> sym_expr symtbl expr
    | Block(block) -> sym_block block (scope_tbl symtbl)
    | Assign(alist) -> List.iter (sym_assn symtbl) alist
    | OpAssign(lvalue, _, expr) -> sym_expr symtbl lvalue; sym_expr symtbl expr
    | IncDec(expr, _) -> sym_expr symtbl expr
    | Print(_, exprlist) -> List.iter (sym_expr symtbl) exprlist
    | Return (expr_opt) -> sym_expr_opt symtbl expr_opt
    | If(clist) -> let outer_scope = scope_tbl symtbl in List.iter (sym_case outer_scope) clist (* TODO *)
    | Switch(stmt, expr_opt, fclist) -> () (* TODO *)
    | For(stmt_opt, expr_opt, stmt_opt2, block) -> () (* TODO *)
    | Break
    | Continue
    | Empty -> ()
and sym_assn symtbl assn = 
    let (lval, expr) = assn in 
    let _ = sym_lval symtbl lval in
    let _ = sym_expr symtbl expr in
    ()
(* the types lvalue and expr are extremely similar but not quite the same *)
and sym_lval symtbl lval = match lval.v with
    | `Blank               -> ()
    | `Op1(op1,exp)        -> sym_expr symtbl exp
    | `Op2(op2, exp, exp2) -> sym_expr symtbl exp; sym_expr symtbl exp2 
    | `Call(exp, explist)  -> sym_expr symtbl exp; List.iter (sym_expr symtbl) explist
    | `Cast(typ, exp)      -> sym_expr symtbl exp
    | `Selector(exp, id)   -> () (* TODO *)
    | `L(lit)              -> ()
    | `Indexing(exp,exp2)  -> sym_expr symtbl exp; sym_expr symtbl exp2
    | `V(id)               -> (match (get_symbol symtbl id true) with 
        | Some s -> ()
        | None   -> symbol_undefined_error lval._start id
    )
and sym_case symtbl case = match case with
    | Case(stmt, exprlist, block) -> (
        let _ = sym_stmt symtbl stmt in
        let _ = List.iter (sym_expr symtbl) exprlist in
        sym_block (scope_tbl symtbl) block
    ) (* TODO *) (* NOTE: we cannot simply call sym_block here because the stmt adds entries into the block's scope *)
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
    | `V(id)               -> (match (get_symbol symtbl id true) with 
        | Some s -> ()
        | None   -> symbol_undefined_error expr._start id
    )
and sym_expr_opt symtbl expr_opt = match expr_opt with
    | Some e -> sym_expr symtbl e
    | None   -> ()

    
