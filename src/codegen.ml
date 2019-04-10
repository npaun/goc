open Golite

let temp_var_count = ref 0
let tmp_count () =
  incr temp_var_count;
  string_of_int !temp_var_count

let continue_label_count = ref 0
let cont_label_count () =
    incr continue_label_count;
    string_of_int !continue_label_count
let goto_cont_label inc =
    "__continue_lbl" ^ (if inc then cont_label_count () else string_of_int !continue_label_count)
    
let array_index_helpers = ref []
let array_index_helper_funname type_str (*n*) = " __arr_index_" ^ type_str (*^ "_" ^ string_of_int n*)
let record_array_indexing_helper typ (*n*) = 
    let already_exists typ' (*n'*) =
        List.exists (fun typ(*, n*) -> typ = typ' (*&& n = n'*)) !array_index_helpers
    in
    let record typ'' (*n''*) =
        if not (already_exists typ'' (*n''*)) then
            Printf.printf "Registering array helper: type = %s\n" (Pretty.string_of_typ typ'')(* n''*);
            array_index_helpers := (typ''(*, n''*))::(!array_index_helpers)
    in record typ (*n*) 
    

let slice_header = 
  "typedef struct {\n" ^
  "\tunsigned int __size;\n" ^
  "\tunsigned int __capacity;\n" ^
  "\tsize_t __el_size;\n" ^
  "\t void* __contents ;\n" ^
  "} __golite_builtin__slice;\n\n"
let gen_file_header = "#include <stdlib.h>\n#include <stdio.h>\n#include <stdbool.h>\n#include <string.h>\n\n" ^ slice_header  

let rec gen_ast ast = match ast with
  | Program(pkg, toplvllist) -> List.fold_right (fun toplvl acc -> (gen_toplvl toplvl) ^ acc) toplvllist ""
and gen_toplvl toplvl = match toplvl.v with
  | Global(decl) -> gen_decl decl ^ ";\n"
  | Func(iden', siglst, typ, block) -> (
    match iden' with
      | `V id -> gen_type typ ^ " " ^ "__golite__" ^ id ^ "(" ^ gen_siglist siglst ^ ")" ^ " " ^ gen_block 0 block ^ "\n"
      | `Blank -> ""
  )
and gen_siglist siglst = 
  let gen_sig = function
    | (`V id, typ) -> gen_type typ ^ " " ^ "__golite__" ^ id
    | (`Blank, typ) -> gen_type typ ^ " " ^ "_golite_tmp" ^ tmp_count ()
  in
  String.concat ", " (List.map gen_sig siglst)
and gen_decl decl =
  let decl_end expr_opt typ = match expr_opt with
    | Some expr -> " = " ^ gen_expr expr
    | None -> ""
  in
  match decl with
    | Var(lhs, typ, expr_opt, isshort) -> (match lhs.v with
      | `V id -> gen_type typ ^ " " ^ id ^ (decl_end expr_opt typ)
      | `Blank -> gen_expr_opt expr_opt
    )
    | Type(iden', typ) -> "" (* I don't think we need to typedef type decls, so we can probably just ignore them *)
and gen_assignlist d alist =
  let start_val = int_of_string(tmp_count ()) in
  let counter = ref 0 in
  let gen_tmps assign = 
    let (lval', exp) = assign in
    (Pretty.crt_tab d true) ^ gen_type (List.hd exp._derived) ^ " __golite_tmp__" ^ (tmp_count ()) ^ " = " ^ gen_expr exp
  in
  let gen_assign assign = 
    let (lval', exp) = assign in
    match lval'.v with
      | `Blank -> ""
      | _ -> 
        incr counter;
        (Pretty.crt_tab d true) ^ gen_lvalue' lval' ^ " = __golite_tmp__" ^ string_of_int (start_val + !counter)
  in
  Pretty.string_of_lst alist ";\n" gen_tmps ^ ";\n" ^ 
  Pretty.string_of_lst alist ";\n" gen_assign
and gen_print ln exprlist = 
    let symbol exp = match List.hd exp._derived with
      | `INT
      | `RUNE -> "%d"
      | `BOOL
      | `STRING -> "%s"
      | `FLOAT64 -> "%.6e"
      | _ -> "-not base type-"
    in
    let expr_arg exp = match List.hd exp._derived with
      | `BOOL -> gen_expr exp ^ " ? \"true\" : \"false\""
      | _ -> gen_expr exp
    in
    if ln then
      let str = Pretty.string_of_lst exprlist " " symbol in
      "printf(\"" ^ str ^ "\\n\"," ^ Pretty.string_of_lst exprlist "," expr_arg ^ ");\n"
    else let str = Pretty.string_of_lst exprlist "" symbol in       "printf(\"" ^ str ^ "\"," ^ Pretty.string_of_lst exprlist "," expr_arg ^ ");\n"
and gen_lvalue' e = match e.v with
  | `Blank -> "__golite__tmp" ^ tmp_count ()
  |  #operand as x ->  gen_expr (Pretty.crt_stmt x)
and gen_block d block = "{\n" ^ (List.fold_right (fun stmt acc -> (gen_stmt (d + 1) stmt) ^ acc) block "") ^ Pretty.crt_tab (d) true ^ "}\n"
and gen_type typ = match typ with
  | `BOOL
  | `INT          -> "int"
  | `RUNE         -> "char"
  | `FLOAT64      -> "float"
  | `STRING       -> "char*"
  | `Type(id)     -> id (* TODO: we want to print the resolved type here *)
  | `AUTO         -> "" (* this shouldn't be reached, probably want to throw an error *)
  | `VOID         -> "void"
  | `TypeLit(t)   -> gen_typelit t
and gen_typelit typlit = match typlit with
  | Slice(typ)    -> "__golite_builtin__slice" (* TODO *)
  | Array(i, typ) -> Hashtbl.find Codegenpre.arr_map (Codegenpre.hash_array i typ)
  | Struct(fields)  -> Hashtbl.find Codegenpre.struct_map (Codegenpre.hash_struct fields)
and gen_stmt d stmt = match stmt.v with
  | Decl(decllst) -> Pretty.crt_tab d true ^ String.concat (";\n" ^ Pretty.crt_tab d true) (List.map gen_decl decllst) ^ ";\n"
  | Expr(expr) -> Pretty.crt_tab d true ^ gen_expr expr ^ ";\n"
  | Block(block) -> gen_block (d+1) block
  | Assign(alist) -> gen_assignlist d alist ^ ";\n"
  | OpAssign(lvalue, op, expr) -> Pretty.crt_tab d true ^ gen_expr lvalue ^ Pretty.string_of_op_assign op ^ gen_expr expr ^ ";\n"
  | IncDec(expr, op) -> Pretty.crt_tab d true ^ gen_expr expr ^ (match op with `INC -> "++" | `DEC -> "--") ^ ";\n"
  | Print(ln, exprlist) -> Pretty.crt_tab d true ^ gen_print ln exprlist
  | Return (expr_opt) -> Pretty.crt_tab d true ^ "return " ^ gen_expr_opt expr_opt ^ ";\n"
  | If(clist) -> gen_if_stmt d clist
  | Switch(stmtn, expr_opt, fclist) -> gen_switch_stmt d stmtn expr_opt fclist
  | For(stmt_opt, expr_opt, stmt_opt2, block) -> gen_for_stmt d stmt_opt expr_opt stmt_opt2 block
  | Break -> Pretty.crt_tab d true ^ "break;\n"
  | Continue -> Pretty.crt_tab d true ^ "goto " ^ goto_cont_label false ^ ";\n"
  | Empty -> ""
and gen_expr expr = match expr.v with
  | `Op1(op1,exp)        -> "(" ^ Pretty.string_of_op1 op1 ^ gen_expr exp ^ ")"
  | `Op2(op2, exp, exp2) -> "(" ^ gen_expr exp ^ " " ^ Pretty.string_of_op2 op2 ^ " " ^ gen_expr exp2 ^ ")"
  | `Call(exp, explist)  -> "__golite__" ^ gen_expr exp ^ "(" ^ (Pretty.string_of_lst explist ", " gen_expr) ^ ")"
  | `Cast(typ, exp)      ->
      (* TODO make this smarter:
       * - If both types resolve to same basic type, remove cast completely (as we'll be using the basic type anyway
       * - If different types, then cast basic types *)
      "(" ^ gen_type typ ^ ")" ^ gen_expr exp
  | `Selector(exp, id)   -> gen_expr expr ^ "." ^ id
  | `L(lit)              -> (match lit with
    | Bool(b) -> if b then "1" else "0"
    | Rune(r) -> r
    | Int(i)  -> string_of_int i
    | Float64(f) -> string_of_float f
    | String(s) -> s
    )
  | `Indexing(id,exp)  -> 
      (* TODO
       * - Pre-generate helper functions for indexing for each basic type 
       * - For each struct type, generate a function
       * - for arrays of arrays (or arrays of slices and vice-versa), figure out a recursive thing *)
      (*gen_expr id ^ "[" ^ gen_expr exp ^ "]"*) (* TODO indexing for slices cant use [] *)
        gen_indexing id exp
  | `V(id)               -> id
and gen_indexing id expr = match List.hd id._derived with
    | `TypeLit Array (n, typ) -> 
        record_array_indexing_helper typ (*n*); 
        array_index_helper_funname (gen_type typ) (*n*)
        ^ "(" ^ gen_expr id ^ ".data" ^ ", " ^ gen_expr expr ^ ")"
    | `TypeLit Slice (typ) -> "TODO"
and gen_expr_opt expr_opt = match expr_opt with
    | Some expr -> gen_expr expr
    | None -> ""
and gen_stmt_opt d stmt_opt = match stmt_opt with
    | Some stmt -> gen_stmt d stmt
    | None -> ""
and close_scopes d n = 
    let rec c_s_rec d n acc = match n with
        | 0 -> acc
        | _ -> c_s_rec (d-1) (n-1) (acc ^ (Pretty.crt_tab (if d >= 0 then d else 0) true) ^ "}\n")
    in
    c_s_rec d n ""
and gen_if_stmt d clist =
    let tab = ref (d) in
    let gen_case case = match case with
        | Case(stmt_opt, exprlst, block) -> 
            gen_stmt_opt (!tab) stmt_opt ^ Pretty.crt_tab !tab true ^ "if (" 
            ^ gen_expr (List.hd exprlst) ^ ") " ^ gen_block (!tab) block  
        | Default(block) -> Pretty.crt_tab !tab true ^ gen_block (!tab) block
    in
    let fold_if clist =
        let rec rec_fold_if clist acc = 
            match clist with
            | [] -> acc
            | h::t -> 
                incr tab; 
                rec_fold_if t (acc ^ gen_case h ^ (
                    match t with 
                    | [] -> "" 
                    | h::t -> Pretty.crt_tab !tab true ^ "else {\n"
                ))
        in
        rec_fold_if clist (Pretty.crt_tab !tab true ^ "{\n")
    in
    let gen = fold_if (clist) in gen ^ (close_scopes (!tab-1) (List.length clist))
and gen_switch_stmt d stmtopt expropt fclist =
    let tab = ref (d) in
    let gen_case case acc = match case with
        | (Case(stmt_opt, exprlst, block), _) -> 
            acc ^ Pretty.crt_tab !tab true ^ "if (" 
            ^ (List.fold_right 
              (fun expr acc -> acc ^ " || " ^ gen_cond_expr expropt ^ "==" ^ gen_expr expr) exprlst "0") 
            ^ ") " ^ gen_block (!tab) block ^ Pretty.crt_tab (!tab) true ^ "else {\n"
        | (Default(block), _) -> acc ^ Pretty.crt_tab !tab true ^ gen_block (!tab) block
    in
    let gen =(List.fold_right (fun c acc -> incr tab; gen_case c acc) (List.rev fclist) "")
    in
    Pretty.crt_tab d true ^ "{\n" 
    ^ gen_stmt_opt (d+1) stmtopt 
    ^ gen ^ close_scopes (!tab-1) (List.length fclist)
and gen_for_stmt d initopt expropt stmtopt block =
    let continue_label = goto_cont_label true in
    Pretty.crt_tab d true ^ "{\n"
    ^ gen_stmt_opt (d+1) initopt 
    ^ Pretty.crt_tab (d+1) true ^ "while (" ^ gen_cond_expr expropt ^ ") {\n"
    ^ List.fold_right (fun stmt acc -> acc ^ gen_stmt (d+2) stmt) (List.rev block) "" 
    (* the ";" is so that it doesn't go crazy if there is no statement after the label *)
    ^ Pretty.crt_tab (d+1) true ^ continue_label ^ ":;\n"
    ^ gen_stmt_opt (d+2) stmtopt
    ^ Pretty.crt_tab (d+1) true ^ "}\n"
    ^ Pretty.crt_tab (d) true ^ "}\n"
and gen_cond_expr expropt = match expropt with
    | Some expr -> gen_expr expr
    | None -> "1"
    
let generate_array_indexing_helpers () =
    let header =
        if List.length !array_index_helpers > 0 then "\n// ---------- Array bounds checking helpers ----------\n" else ""
    in
    let gen_arr_func typ acc =
        let type_str = gen_type typ in
        acc 
        ^ "// Type: " ^ type_str (*^ ", size: " ^ string_of_int n*) ^ "\n"
        ^ "static inline __attribute__((always_inline))\n" 
        ^ type_str ^ array_index_helper_funname type_str (*n*)
        ^ "(" ^ type_str ^ " arg[], int index) {\n"
        ^ "\tif (index >= 0 && index < (sizeof(arg /* TODO - this is wrong */)/sizeof(arg[0]))) return arg[index];\n"
        ^ "\telse /* TODO error message */ exit(1);\n"
        ^ "}\n\n"
    in
    List.fold_right gen_arr_func !array_index_helpers header
    

(* TODO - plug the generation of indexing helpers and improve them *)    
let gen_c_code filename ast =
  Codegenpre.codepre_ast ast;
  let ast_code = gen_ast ast in
  let arr_helps = generate_array_indexing_helpers () in
  let gend_structs = (String.concat "" !Codegenpre.struct_decls) in
  let code = 
    gen_file_header ^ arr_helps ^ gend_structs ^ ast_code ^ "int main() {\n\t__golite__main();\n}\n" in
  let oc = open_out ((Filename.remove_extension filename) ^ ".c") in 
  Printf.fprintf oc "%s" code; close_out oc

