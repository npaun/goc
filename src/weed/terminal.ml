(* This weeding pass focuses on ensuring that terminal statements are used in a correct manner.
1. Break and continue are legal only in loops and must be last statement of their branch.
2. Return, in all cases, must be the last statement of the branch
3. If a function is not void, all branches must return
*)
open Golite

let disablereturn = true (*extra free points ya*)

let rec pass = function 
| Program(package,decls) -> Program(package, List.map pass_toplevel decls)
and pass_toplevel node = {node with v = match node.v with 
| Global d -> Global d
| Func(name,signature,`VOID,block) -> Func (name,signature,`VOID, pass_block (false,false,false)  block)
| Func(name,signature,ret,block) -> Func (name,signature,ret, pass_block (true,false,false) block)
}
and pass_block mode block = 
let (mustreturn,_,_) = mode in
let rec aux = function
| [] -> []
| [last] when (mustreturn && (not disablereturn)) -> [{last with v = force_return mode last.v}]
| [{v = Return any}] as n -> n (* this is ok, they did not have to return but they did anyway *)
| h::t -> let imp1 = ({h with v = pass_statement mode h.v}) in
		imp1::(pass_block mode t)
in match block with
| [] when (mustreturn && (not disablereturn)) -> raise (SyntaxError "This function must return a result but this block is empty")
| any -> aux any

and pass_statement (mustreturn,maybreak,maycontinue) = function
| Break when not maybreak -> raise (SyntaxError "break must only be used in a non-terminal loop or switch")
| Continue when not maycontinue -> raise (SyntaxError "continue must only be used in a loop")
| If cases -> If (List.map (pass_case (false,maybreak,maycontinue)) cases)
| Switch(stmt, expr, fallcases) -> Switch(stmt,expr, List.map (pass_fallablecase (false,true,false)) fallcases)
| For(stmt1,expr,stmt2,block) -> For(stmt1,expr,stmt2, pass_block (false,true,true) block)
| Block blk -> Block (pass_block (false,maybreak,maycontinue) blk)
| any -> any
and pass_case mode = function
| Case(stmt,expr,block) -> Case(stmt,expr, pass_block mode block)
| Default block -> Default (pass_block mode block)
and pass_fallablecase mode = function
| (case,falltype) -> (pass_case mode case, falltype)
and force_return (_,maybreak,maycontinue) = function
| Return any -> Return any (* good *)
| If(cases) -> If (List.map (pass_case (true,maybreak,maycontinue)) cases)
| For(stmt1,None,stmt2,blk) -> For(stmt1,None,stmt2, (pass_block (true,false,true) blk))
| Switch(stmt1,expr,fallcases) -> Switch(stmt1,expr,(pass_switch fallcases))
| Block(blk) -> Block(pass_block (true,maybreak,maycontinue) blk)
| any -> raise (SyntaxError ("This function must return a result but " ^ (Pretty.crt_stmt any |> Pretty.string_of_stmt 0 false) ^ " is not a terminal statement.")) 
and pass_switch cases = 
	let has_default = List.exists (function | ((Default _),_)  -> true | _ -> false) cases in
		if has_default then
			List.map (pass_fallablecase (true,false,false)) cases
		else
			raise (SyntaxError "A terminal switch statement must have a default case")

