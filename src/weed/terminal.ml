(* This weeding pass focuses on ensuring that terminal statements are used in a correct manner.
1. Break and continue are legal only in loops and must be last statement of their branch.
2. Return, in all cases, must be the last statement of the branch
3. If a function is not void, all branches must return
*)
open Golite

let rec pass = function 
| Program(package,decls) -> Program(package, List.map pass_toplevel decls)
and pass_toplevel node = {node with v = match node.v with 
| Global d -> Global d
| Func(name,signature,`VOID,block) -> Func (name,signature,`VOID, pass_block false false  block)
| Func(name,signature,ret,block) -> Func (name,signature,ret, pass_block true false block)
}
and pass_block mustreturn maybreak block = 
let rec aux = function
| [] -> []
| [last] when mustreturn -> [{last with v = force_return maybreak last.v}]
| h::t -> ({h with v = pass_statement mustreturn maybreak h.v})::(pass_block mustreturn maybreak t)
in match block with
| [] when mustreturn -> raise (SyntaxError "Totally dmppty!")
| any -> aux any

and pass_statement mustreturn maybreak = function
| Break when not maybreak -> raise (SyntaxError "Your fucking shit is breaking for no fucking reason fuck you")
| Continue when not maybreak -> raise (SyntaxError "you are the worst programmer in the history of programmers")
| If cases -> If (List.map (pass_case false maybreak) cases)
| Switch(stmt, expr, fallcases) -> Switch(stmt,expr, List.map (pass_fallablecase false true) fallcases)
| For(stmt1,expr,stmt2,block) -> For(stmt1,expr,stmt2, pass_block false true block)
| Block blk -> Block (pass_block false maybreak blk)
| any -> any 
and pass_case mustreturn maybreak = function
| Case(stmt,expr,block) -> Case(stmt,expr, pass_block mustreturn maybreak block)
| Default block -> Default (pass_block mustreturn maybreak block)
and pass_fallablecase mustreturn maybreak = function
| (case,mode) -> (pass_case mustreturn maybreak case, mode)
and force_return maybreak = function
| Return any -> Return any (* good *)
| If(cases) -> If (List.map (pass_case true maybreak) cases)
| For(stmt1,None,stmt2,blk) -> For(stmt1,None,stmt2, (pass_block true false blk)) (*maycontinue is separate from maybreak *)
(* there are some special rules for switch do not feel like implementing *)
| Block(blk) -> Block(pass_block true maybreak blk)
| any -> raise (SyntaxError ("DIE IN A HOLE!" ^ (Golite.sexp_of_statement_node any |> Sexplib.Sexp.to_string_hum)))
