open Golite

exception SymbolErr of string
exception SymbolInvInputErr of string
exception SymbolUndefinedErr of string

let print_sym = ref false
let unboundfunc_count = ref 0

(* handle user-defined types as a symbol and lookup the table when a type is used? *)
type symbolkind = VarK | TypeK | FuncK | ConstK (* other kinds? *)

(* the point here is to get the annotation for position info *)
(* type astnode = Topnode of toplevel_declaration annotated | Stmtnode of statement | Exprnode of expression (* add more? *) *)

(* Any other relevant field? *)
type symbol = {
    mutable name : string; (* or identifier'? *)
    mutable kind : symbolkind;
    mutable typ  : gotype list;
    }
    
(* hashtbl(name, sym) * parent (optional) * children * depth *)
type symtbl = Symt of (string, symbol) Hashtbl.t * (symtbl ref) option * (symtbl ref) list * int


let sym_name sym = if (String.get sym.name 0) = '$' then "init" else sym.name

(* PRINTING *)
(************)
let rec print_symbol sym tbl = 
    let Symt(_,_,_,depth) = tbl in
    Printf.printf "%s%s [%s] = %s\n" (String.make (depth + 1) '\t') (sym_name sym) (string_of_kind sym.kind) (string_of_typ_list sym.typ sym.kind)
and string_of_typ_list typ kind = match kind with
    | VarK   
    | TypeK
    | ConstK -> string_of_typ kind (List.hd typ)
    | FuncK  -> (match typ with
        | h::[] -> string_of_typ kind h
        | h::t -> Printf.sprintf "(%s) -> %s" (String.concat ", " (List.map (string_of_typ kind) t )) (string_of_typ kind h)
        | []    -> "INVALID FUNC TYPE - EMPTY LIST"
    )
and string_of_kind kind = match kind with 
    | VarK   -> "variable"
    | TypeK  -> "type"
    | FuncK  -> "function"
    | ConstK -> "constant"
and string_of_typ kind typ = match typ,kind with
    | `BOOL,_         -> "bool"
    | `RUNE,_         -> "char"
    | `INT,_          -> "int"
    | `FLOAT64,_      -> "float64"
    | `STRING,_       -> "string"
    | `Type(id),_     -> id
    | `AUTO, FuncK    -> "<unmapped>"
    | `AUTO,_         -> "<infer>"
    | `VOID,_ -> ""
    | `TypeLit(t),_   -> string_of_typlit t
(* had to copy this from pretty.ml due to differences with struct printing *)
and string_of_typlit typlit = match typlit with
    | Slice(typ)    -> "[]" ^ string_of_typ TypeK typ
    | Array(i, typ) -> "[" ^ string_of_int i ^ "]" ^ string_of_typ TypeK typ
    | Struct(mems)  -> "struct { " ^ (string_of_sigs mems "; ") ^ " }"
and string_of_sigs sigs sep = 
    let string_of_sig = function
        | (id, typ) -> id ^ " " ^ string_of_typ VarK typ
    in
    String.concat sep (List.map string_of_sig sigs)

(* ERROR HELPERS *)
(*****************)
let symbol_error sym start =
    let line, chr = start in
    let msg = "At line: " ^ string_of_int line ^ " char: " ^ string_of_int chr ^ ", " ^
    (match sym.kind with
    | VarK -> "variable " ^ sym.name
    | TypeK -> "type " ^ sym.name (* or typ *)
    | FuncK -> "funcion " ^ sym.name
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


(* UTIL FUNCS *)
(**************)

let gen_stmt stmt_node stmt = {v = stmt_node; _debug = stmt._debug; _start = stmt._start; _end = stmt._end; _derived = stmt._derived }
let gen_stmt_opt stmt_node_opt stmt = match stmt_node_opt with
    | Some stmt_node -> Some(gen_stmt stmt_node stmt)
    | None -> None

(* string -> symbolkind -> gotype list -> astnode -> symbol *)    
let make_symbol n k t = {
    name = n; kind = k; typ = t
}

(* ref symtbl -> symtbl *)
let make_tbl parent = 
    let Symt(_, _, _, d) = !parent in
    Symt(Hashtbl.create 500, Some (parent), [], d + 1)

(* symtbl -> symtbl ref option *)
let get_parent tbl = match tbl with
| Symt(_, parent, _, _) -> parent

(* symtbl ref -> symtbl ref -> symtbl *)
(* Adds tbl2 to tbl1's children, returns copy of tbl1 *)
let add_child (tbl1 : symtbl ref) (tbl2 : symtbl ref) = match !tbl1 with
    | Symt(tbl, parent, children, d) -> tbl1 := Symt(tbl, parent, children @ [tbl2], d); !tbl1

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


let unbound_getandinc = unboundfunc_count := !unboundfunc_count + 1; !unboundfunc_count - 1
let handle_unbound_func tbl sym = match tbl with
    | Symt(table, _, _, _) -> Hashtbl.add table ("$" ^ sym.name ^ string_of_int unbound_getandinc) sym; if !print_sym then print_symbol sym tbl


(* symbol -> symtbl -> unit *)
let put_symbol tbl sym start =
    if (sym.name = "init" || sym.name = "_") &&  sym.kind = FuncK then handle_unbound_func tbl sym
    else (
        match tbl with
            | Symt(table, _, _, _) ->
                match get_symbol tbl sym.name false with
                | None -> Hashtbl.add table sym.name sym; if !print_sym then print_symbol sym tbl
                | Some s -> symbol_error sym start
    )

let put_symbol_short_decl tbl sym start hasnew = match tbl with
    | Symt(table, _, _, _) -> match (get_symbol tbl sym.name false), hasnew with
        | None, _ -> Hashtbl.add table sym.name sym; if !print_sym then print_symbol sym tbl
        | Some s, true -> () (* if we have new vars in short decl we ignore redeclares *)
        | Some s, false -> 
            let (line,chr) = start in 
            raise (SymbolErr ("At line: " ^ string_of_int line ^ " char: " ^ string_of_int chr ^ ", short declaration contains no new variables"))

(* ref symtbl -> ref symtbl *)        
(* makes new table with arg as parent, adds it to the parent's children and returns it *)        
let scope_tbl parent = 
    let newtbl = ref (make_tbl parent) in
    let Symt(_,_,_,d) = add_child parent newtbl in
    if !print_sym then Printf.printf "%s{\n" (String.make (d+1) '\t');
    newtbl  

let unscope_tbl tbl = 
    let Symt(_,_,_,d) = !tbl in
    if !print_sym then Printf.printf "%s}\n" (String.make d '\t')

let get_func_typ iden' siglist ret_typ = 
    let rec get_sig_typ sigl acc = match sigl with
        | (iden, got)::t -> get_sig_typ t (got::acc)
        | [] -> acc
    in
    match iden' with
        | `V(id) -> if id == "init" then [`AUTO] else ret_typ::(get_sig_typ siglist [])
        | `Blank -> [`AUTO]
  
(* identifier' -> symbolkind -> gotype -> astnode -> symtbl -> unit *)
(* puts an indentifier' into the given symtbl *)
let put_iden iden' kind typ start symtbl = match iden' with
    | `V(id) -> put_symbol symtbl (make_symbol id kind typ) start
    | `Blank -> match kind with
        | FuncK -> put_symbol symtbl (make_symbol "_" kind typ) start
        | _ -> ()

let invalid_maininit_check iden' siglist typ start = match iden' with
    | `V(id) -> 
        if (id = "main" || id = "init") then (match siglist, typ with
            | [], `VOID -> ()
            | _,_       -> 
                let (line,chr) = start in 
                raise (SymbolInvInputErr ("At line: " ^ string_of_int line ^ " char: " ^ string_of_int chr ^ ", "^ id ^ " must have no parameters and no return value"))
        )
    | `Blank -> ()

let rec has_new_vars symtbl decllst = match decllst with
    | h::t -> (match h with 
        | Var(lhs, _, _, _) -> (match lhs.v with
            | `V(id) -> (match get_symbol symtbl id false with
                | Some s -> has_new_vars symtbl t
                | None   -> true 
            )
            | `Blank -> has_new_vars symtbl t
        )
        | Type(_,_) -> false
    )
    | []   -> false

(* SYMBOL GENERATION *)
(*********************)
let rec sym_ast ast (symtbl : symtbl ref) = match ast with
    | Program(pkg, toplvllist) -> List.iter (fun t -> (sym_toplvl t symtbl)) toplvllist
and sym_toplvl toplvl (symtbl : symtbl ref) = match toplvl.v with
    | Global(decl) -> sym_decl toplvl._start symtbl false decl
    | Func(iden', siglst, typ, block) -> (
        invalid_maininit_check iden' siglst typ toplvl._start;
        let func_typ = get_func_typ iden' siglst typ in
        put_iden iden' FuncK func_typ toplvl._start !symtbl;
        let csymtbl = scope_tbl symtbl in
        sym_siglist toplvl siglst csymtbl;
        sym_block csymtbl block;
        unscope_tbl csymtbl
    )
and sym_siglist toplvl siglist symtbl = List.iter (fun (id, typ) -> put_symbol !symtbl (make_symbol id VarK [typ]) toplvl._start) siglist
and sym_block symtbl block =
    let Symt(_,_,_,d) = !symtbl in
    List.iter (sym_stmt symtbl) block;
and sym_stmt symtbl stmt = match stmt.v with
    | Decl(decllst) -> List.iter (sym_decl stmt._start symtbl (has_new_vars !symtbl decllst)) decllst
    | Expr(expr) -> sym_expr symtbl expr
    | Block(block) -> let tbl = scope_tbl symtbl in sym_block tbl block; unscope_tbl tbl
    | Assign(alist) -> List.iter (sym_assn symtbl) alist
    | OpAssign(lvalue, _, expr) -> sym_expr symtbl lvalue; sym_expr symtbl expr
    | IncDec(expr, _) -> sym_expr symtbl expr
    | Print(_, exprlist) -> List.iter (sym_expr symtbl) exprlist
    | Return (expr_opt) -> sym_expr_opt symtbl expr_opt
    | If(clist) -> let outer_scope = scope_tbl symtbl in List.iter (sym_case stmt outer_scope) clist; unscope_tbl outer_scope
    | Switch(stmtn, expr_opt, fclist) -> (
        let outer_scope = scope_tbl symtbl in 
        let _ = sym_stmt outer_scope (gen_stmt stmtn stmt) in
        let _ = sym_expr_opt outer_scope expr_opt in
        List.iter (fun (c, ftm) -> sym_case stmt outer_scope c) fclist;
        unscope_tbl outer_scope
    )
    | For(stmt_opt, expr_opt, stmt_opt2, block) -> (
        let for_scope = scope_tbl symtbl in
        let _ = sym_stmt_opt for_scope (gen_stmt_opt stmt_opt stmt) in
        let _ = sym_expr_opt for_scope expr_opt in
        let _ = sym_stmt_opt for_scope (gen_stmt_opt stmt_opt2 stmt) in
        let tbl = scope_tbl for_scope in 
        sym_block tbl block;
        unscope_tbl tbl;
        unscope_tbl for_scope
    )
    | Break
    | Continue
    | Empty -> ()
and sym_stmt_opt symtbl stmt_opt = match stmt_opt with
    | Some stmt -> sym_stmt symtbl stmt
    | None      -> ()
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
    | `Selector(exp, id)   -> sym_expr symtbl exp
    | `L(lit)              -> ()
    | `Indexing(exp,exp2)  -> sym_expr symtbl exp; sym_expr symtbl exp2
    | `V(id)               -> (match (get_symbol !symtbl id true) with 
        | Some s -> ()
        | None   -> symbol_undefined_error lval._start id
    )
and sym_case stmt symtbl case = match case with
    | Case(stmtnode, exprlist, block) -> (
        let _ = sym_stmt symtbl (gen_stmt stmtnode stmt) in
        let _ = List.iter (sym_expr symtbl) exprlist in
        let tbl = scope_tbl symtbl in
        sym_block tbl block;
        unscope_tbl tbl
    ) 
    | Default(block)              -> sym_block symtbl block
and sym_decl s symtbl hasnew decl = match decl with
    | Var(lhs, typ, expr_opt, isshort) -> (match lhs.v, isshort with
        | `V(id), false -> put_symbol !symtbl (make_symbol id VarK [typ]) s; sym_expr_opt symtbl expr_opt
        | `V(id), true  -> put_symbol_short_decl !symtbl (make_symbol id VarK [typ]) s hasnew; sym_expr_opt symtbl expr_opt
        | `Blank, _ -> sym_expr_opt symtbl expr_opt
        | _, _      -> symbol_invalid_input_error s "invalid lhs given in declaration - can only be identifier"
    )
    | Type(iden', typ) -> put_iden iden' TypeK [typ] s !symtbl
and sym_expr symtbl expr = match expr.v with
    | `Op1(op1,exp)        -> sym_expr symtbl exp
    | `Op2(op2, exp, exp2) -> sym_expr symtbl exp; sym_expr symtbl exp2 
    | `Call(exp, explist)  -> sym_expr symtbl exp; List.iter (sym_expr symtbl) explist
    | `Cast(typ, exp)      -> sym_expr symtbl exp
    | `Selector(exp, id)   -> sym_expr symtbl exp
    | `L(lit)              -> ()
    | `Indexing(exp,exp2)  -> sym_expr symtbl exp; sym_expr symtbl exp2
    | `V(id)               -> (match (get_symbol !symtbl id true) with 
        | Some s -> ()
        | None   -> symbol_undefined_error expr._start id
    )
and sym_expr_opt symtbl expr_opt = match expr_opt with
    | Some e -> sym_expr symtbl e
    | None   -> ()

    
(* unit -> symtbl *)
(* used to create a table without a parent *)
let init_tbl print ast = 
    let root_tbl = ref (Symt(Hashtbl.create 500, None, [], 0)) in
    print_sym := print;
    if !print_sym then Printf.printf "{\n";
    put_symbol !root_tbl (make_symbol "int" TypeK [`INT]) (-1,-1);
    put_symbol !root_tbl (make_symbol "float64" TypeK [`FLOAT64]) (-1, -1);
    put_symbol !root_tbl (make_symbol "bool" TypeK [`BOOL]) (-1,-1);
    put_symbol !root_tbl (make_symbol "rune" TypeK [`RUNE]) (-1,-1);
    put_symbol !root_tbl (make_symbol "string" TypeK [`STRING]) (-1,-1);
    put_symbol !root_tbl (make_symbol "true" ConstK [`BOOL]) (-1,-1);
    put_symbol !root_tbl (make_symbol "false" ConstK [`BOOL]) (-1,-1);
    put_symbol !root_tbl (make_symbol "append" FuncK [`AUTO; `AUTO; `AUTO]) (-1,-1);
    put_symbol !root_tbl (make_symbol "len" FuncK [`AUTO; `INT]) (-1,-1);
    put_symbol !root_tbl (make_symbol "cap" FuncK [`AUTO; `INT]) (-1,-1);
    let tbl = scope_tbl root_tbl in
    sym_ast ast tbl;
    unscope_tbl tbl;
    if !print_sym then Printf.printf "}\n";
    root_tbl
