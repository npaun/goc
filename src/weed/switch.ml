(* This weeding pass ensure that there is at most one default case in the switch statements *)

open Golite

let err line cpos = 
    raise (SyntaxError ("Parser - in switch statement starting at: line " ^ string_of_int line
    ^ ", char " ^ string_of_int cpos ^ ".\nA switch statement must have AT MOST one default case."))

let rec pass = function
| Program(package,decls) -> Program(package, List.map pass_toplevel decls)
and pass_toplevel node = {node with v = match node.v with 
| Global d -> Global d
| Func(name,signature,`VOID,block) -> Func (name,signature,`VOID, pass_block block)
| Func(name,signature,ret,block) -> Func (name,signature,ret, pass_block block)
}
and pass_block block = 
let rec aux = function
| [] -> []
| [{v = Return any}] as n -> n (* this is ok, they did not have to return but they did anyway *)
| h::t -> let imp1 = ({h with v = pass_statement h.v (fun () -> let (line, cpos) = h._start in err line cpos)}) in imp1::(pass_block t)
in match block with
    | any -> aux any
and pass_statement stmt fail = match stmt with
    | Switch(stmt, expr, fallcases) -> Switch(stmt,expr, pass_switch fallcases fail)
    | any -> any
and pass_switch cases fail = 
    let default_ctr = ref 0 in
    let lst = List.map (pass_fallablecase default_ctr) cases in
    if !default_ctr <= 1 then lst
    else fail (); lst
and pass_case ctr = function
    | Case(stmt,expr,block) -> Case(stmt,expr, pass_block block)
    | Default block -> incr ctr; Default (pass_block block)
and pass_fallablecase ctr = function
    | (case,falltype) -> (pass_case ctr case, falltype)
