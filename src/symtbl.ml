open Golite

exception SymbolErr of string
exception SymbolInvInputErr of string
    
(* handle user-defined types as a symbol and lookup the table when a type is used? *)
type symbolkind = Var | Type | Func (* other kinds? *)

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
    | Var -> "variable " ^ sym.name
    | Type -> "type " ^ sym.name (* or typ *)
    ) ^ " is already defined in this scope!"
    in raise (SymbolErr (msg))

let symbol_invalid_input_error start m = 
    let line, chr = start in
    let msg = "At line: " ^ string_of_int line ^ " char: " ^ string_of_int chr ^ ", " ^ m in
    raise (SymbolInvInputErr (msg))
    
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

let rec sym_ast ast symtbl = match ast with
    | Program(pkg, toplvllist) -> List.iter (fun t -> (sym_toplvl t symtbl)) toplvllist
and sym_toplvl toplvl symtbl = match toplvl.v with
    | Global(decl) -> (match decl with
        | Var(lhs, typ, _, _) -> (match lhs.v with
            | `V(id) -> put_symbol symtbl (make_symbol id Var typ (Topnode(toplvl)))
            | _      -> symbol_invalid_input_error toplvl._start "invalid lhs given in declaration - can only be identifier"
        )
        | Type(iden', typ) -> put_iden iden' Type typ (Topnode(toplvl)) symtbl
    )
    | Func(iden', siglst, typ, block) -> (
        put_iden iden' Func typ (Topnode(toplvl)) symtbl;
        let csymtbl = scope_tbl symtbl in
        sym_siglist toplvl siglst csymtbl;
        sym_block block csymtbl;
    )

and sym_siglist toplvl siglist symtbl =  () (* List.iter (fun (iden', typ) -> put_iden iden' Var typ (Topnode(toplvl)) symtbl) siglist *)
and sym_block block symtbl = ()

