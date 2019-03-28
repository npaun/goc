open Golite

let rec gen_ast ast = match ast with
  | Program(pkg, toplvllist) -> List.iter gen_toplvl toplvllist
and gen_toplvl toplvl = match toplvl.v with
  | Global(decl) -> gen_decl decl
  | Func(iden', siglst, typ, block) -> ()
and gen_decl decl = match decl with
  | Var(lhs, typ, expr_opt, isshort) -> ()
  | Type(iden', typ) -> ()
and gen_block block = List.iter gen_stmt block
and gen_stmt stmt = match stmt.v with
  | Decl(decllst) -> ()
  | Expr(expr) -> ()
  | Block(block) -> ()
  | Assign(alist) -> ()
  | OpAssign(lvalue, _, expr) -> ()
  | IncDec(expr, _) -> ()
  | Print(_, exprlist) -> ()
  | Return (expr_opt) -> ()
  | If(clist) -> ()
  | Switch(stmtn, expr_opt, fclist) -> ()
  | For(stmt_opt, expr_opt, stmt_opt2, block) -> ()
  | Break
  | Continue
  | Empty -> ()
and gen_expr expr = match expr.v with
  | `Op1(op1,exp)        -> ()
  | `Op2(op2, exp, exp2) -> ()
  | `Call(exp, explist)  -> ()
  | `Cast(typ, exp)      -> ()
  | `Selector(exp, id)   -> ()
  | `L(lit)              -> ()
  | `Indexing(exp,exp2)  -> ()
  | `V(id)               -> ()
