open Golite

exception SymbolErr of string
    
(* handle user-defined types as a symbol and lookup the table when a type is used? *)
type symbolkind = Var | Type (* other kinds? *)

(* the point here is to get the annotation for position info *)
type astnode = Stmtnode of statement | Exprnode of expression (* add more? *)

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

let rec sym_ast ast symtbl = match ast with
    | Program(pkg, toplvllist) -> List.iter (fun t -> (sym_toplvl t symtbl)) toplvllist
and sym_toplvl toplvl symtbl = match toplvl.v with
    | Global(decl) -> (match decl with
        | Var(lhs, `AUTO, Some expr, _) -> (match lhs.v with
            | `V(id) -> put_symbol symtbl (make_symbol id Var `AUTO (Stmtnode({v: decl; _debug = toplvl._debug; _start = toplvl._start; _end = toplvl._end; _derived = toplvl._derived})))
            | _      -> raise (SymbolError "Variable declaration with non-identifier lhs given to symbol table")
        )
    )

