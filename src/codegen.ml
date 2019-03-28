open Golite

let gen_file_header = "#include <stdlib.h>\n#include <stdio.h>\n#include <stdbool.h>\n#include <string.h>\n\n\n" 

let rec gen_ast ast = match ast with
  | Program(pkg, toplvllist) -> List.fold_right (fun toplvl acc -> acc ^ (gen_toplvl toplvl)) toplvllist ""
and gen_toplvl toplvl = match toplvl.v with
  | Global(decl) -> gen_decl decl
  | Func(iden', siglst, typ, block) -> (
    match iden' with
      | `V id -> gen_type typ ^ " " ^ id ^ "(" ^ gen_siglist siglst ^ ")" ^ " " ^ gen_block block
      | `Blank -> ""
  )
and gen_siglist siglst = ""
and gen_decl decl = match decl with
  | Var(lhs, typ, expr_opt, isshort) -> ""
  | Type(iden', typ) -> ""
and gen_block block = "{\n" ^ (List.fold_right (fun stmt acc -> acc ^ (gen_stmt stmt)) block "") ^ "}\n"
and gen_type typ = match typ with
  | `BOOL
  | `INT          -> "int"
  | `RUNE         -> "char"
  | `FLOAT64      -> "float"
  | `STRING       -> "char*"
  | `Type(id)     -> id
  | `AUTO         -> "" (* this shouldn't be reached, probably want to throw an error *)
  | `VOID         -> "void"
  | `TypeLit(t)   -> gen_typelit t
and gen_typelit typlit = match typlit with
  | Slice(typ)    -> "[]" ^ gen_type typ 
  | Array(i, typ) -> gen_type typ ^ Printf.sprintf "[%d]" i
  | Struct(mems)  -> "struct" (* TODO *)
and gen_stmt stmt = match stmt.v with
  | Decl(decllst) -> ""
  | Expr(expr) -> ""
  | Block(block) -> ""
  | Assign(alist) -> ""
  | OpAssign(lvalue, _, expr) -> ""
  | IncDec(expr, _) -> ""
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
  | `L(lit)              -> ""
  | `Indexing(exp,exp2)  -> ""
  | `V(id)               -> ""

let gen_c_code filename ast = 
  let code = gen_file_header ^ (gen_ast ast) in
  let oc = open_out ((Filename.remove_extension filename) ^ ".c") in 
  Printf.fprintf oc "%s" code; close_out oc
