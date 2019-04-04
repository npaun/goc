open Golite

let temp_var_count = ref 0
let tmp_count () =
  incr temp_var_count;
  string_of_int !temp_var_count

let slice_header = 
  "typedef struct {\n" ^
  "\tunsigned int __size;\n" ^
  "\tunsigned int __capacity;\n" ^
  "\tsize_t __el_size;\n" ^
  "\t void* __contents ;\n" ^
  "}__golite_builtin__slice;\n"
let gen_file_header = "#include <stdlib.h>\n#include <stdio.h>\n#include <stdbool.h>\n#include <string.h>\n\n" ^ slice_header  


let rec gen_ast ast = match ast with
  | Program(pkg, toplvllist) -> List.fold_right (fun toplvl acc -> (gen_toplvl toplvl) ^ acc) toplvllist ""
and gen_toplvl toplvl = match toplvl.v with
  | Global(decl) -> gen_decl decl ^ ";\n"
  | Func(iden', siglst, typ, block) -> (
    match iden' with
      | `V id -> gen_type typ ^ " " ^ "__golite__" ^ id ^ "(" ^ gen_siglist siglst ^ ")" ^ " " ^ gen_block block
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
and gen_assignlist alist =
  let start_val = int_of_string(tmp_count ()) in
  let counter = ref 0 in
  let gen_tmps assign = 
    let (lval', exp) = assign in
    gen_type (List.hd exp._derived) ^ " __golite_tmp__" ^ (tmp_count ()) ^ " = " ^ gen_expr exp
  in
  let gen_assign assign = 
    let (lval', exp) = assign in
    match lval'.v with
      | `Blank -> ""
      | _ -> 
        incr counter;
        gen_lvalue' lval' ^ " = __golite_tmp__" ^ string_of_int (start_val + !counter)
  in
  Pretty.string_of_lst alist ";\n" gen_tmps ^ ";\n" ^ 
  Pretty.string_of_lst alist ";\n" gen_assign

and gen_lvalue' e = match e.v with
  | `Blank -> "__golite__tmp" ^ tmp_count ()
  |  #operand as x ->  gen_expr (Pretty.crt_stmt x)
and gen_block block = "{\n" ^ (List.fold_right (fun stmt acc -> (gen_stmt stmt) ^ acc) block "") ^ "}\n"
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
  | Array(i, typ) -> gen_type typ ^ Printf.sprintf "[%d]" i
  | Struct(mems)  -> "struct" (* TODO *)
and gen_stmt stmt = match stmt.v with
  | Decl(decllst) -> String.concat ";\n" (List.map gen_decl decllst) ^ ";\n"
  | Expr(expr) -> gen_expr expr
  | Block(block) -> gen_block block
  | Assign(alist) -> gen_assignlist alist ^ ";\n"
  | OpAssign(lvalue, _, expr) -> ""
  | IncDec(expr, op) -> gen_expr expr ^ (match op with `INC -> "++" | `DEC -> "--")
  | Print(_, exprlist) -> ""
  | Return (expr_opt) -> ""
  | If(clist) -> ""
  | Switch(stmtn, expr_opt, fclist) -> ""
  | For(stmt_opt, expr_opt, stmt_opt2, block) -> ""
  | Break
  | Continue
  | Empty -> ""
and gen_expr expr = match expr.v with
  | `Op1(op1,exp)        -> "(" ^ Pretty.string_of_op1 op1 ^ gen_expr exp ^ ")"
  | `Op2(op2, exp, exp2) -> "(" ^ gen_expr exp ^ " " ^ Pretty.string_of_op2 op2 ^ " " ^ gen_expr exp2 ^ ")"
  | `Call(exp, explist)  -> "__golite__" ^ gen_expr exp ^ "(" ^ (Pretty.string_of_lst explist ", " gen_expr) ^ ")"
  | `Cast(typ, exp)      -> "(" ^ gen_type typ ^ ")" ^ gen_expr exp
  | `Selector(exp, id)   -> gen_expr expr ^ "." ^ id
  | `L(lit)              -> (match lit with
    | Bool(b) -> if b then "1" else "0"
    | Rune(r) -> r
    | Int(i)  -> string_of_int i
    | Float64(f) -> string_of_float f
    | String(s) -> s
    )
  | `Indexing(id,exp)  -> gen_expr id ^ "[" ^ gen_expr exp ^ "]" (* TODO indexing for slices cant use [] *)
  | `V(id)               -> id
and gen_expr_opt expr_opt = match expr_opt with
  | Some expr -> gen_expr expr
  | None -> ""


let gen_c_code filename ast = 
  let code = gen_file_header ^ (gen_ast ast) ^ "int main() {\n\t__golite__main();\n}\n" in
  let oc = open_out ((Filename.remove_extension filename) ^ ".c") in 
  Printf.fprintf oc "%s" code; close_out oc
