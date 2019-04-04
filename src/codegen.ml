open Golite

let gen_file_header = "#include <stdlib.h>\n#include <stdio.h>\n#include <stdbool.h>\n#include <string.h>\n\n\n" 


let temp_var_count = ref 0
let get_count =
  temp_var_count := !temp_var_count + 1;
  !temp_var_count

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
    | (`Blank, typ) -> gen_type typ ^ " " ^ "_golite_garbage" ^ string_of_int get_count
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
    | Type(iden', typ) -> ""
and gen_block block = "{\n" ^ (List.fold_right (fun stmt acc -> acc ^ (gen_stmt stmt)) block "") ^ "}\n"
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
  | Slice(typ)    -> "[]" ^ gen_type typ 
  | Array(i, typ) -> gen_type typ ^ Printf.sprintf "[%d]" i
  | Struct(mems)  -> "struct" (* TODO *)
and gen_stmt stmt = match stmt.v with
  | Decl(decllst) -> ""
  | Expr(expr) -> gen_expr expr
  | Block(block) -> gen_block block
  | Assign(alist) -> ""
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
  | `Op1(op1,exp)        -> ""
  | `Op2(op2, exp, exp2) -> ""
  | `Call(exp, explist)  -> ""
  | `Cast(typ, exp)      -> ""
  | `Selector(exp, id)   -> ""
  | `L(lit)              -> (match lit with
    | Bool(b) -> if b then "1" else "0"
    | Rune(r) -> r
    | Int(i)  -> string_of_int i
    | Float64(f) -> string_of_float f
    | String(s) -> s
    )
  | `Indexing(exp,exp2)  -> ""
  | `V(id)               -> ""
and gen_expr_opt expr_opt = match expr_opt with
  | Some expr -> gen_expr expr
  | None -> ""

let gen_c_code filename ast = 
  let code = gen_file_header ^ (gen_ast ast) in
  let oc = open_out ((Filename.remove_extension filename) ^ ".c") in 
  Printf.fprintf oc "%s" code; close_out oc
