(* This weeding pass will eventually perform the lvalue check (assignable expressions)
for now, its only goal is:
1. lvalues are not actually valid for typed_var_declarations, only identifiers, so ensure that this is respected
*)
open Golite

let rec pass = function
| Program(pkg,decls) -> Program(pkg, List.map pass_toplevel decls)
and pass_toplevel n = match n.v with
| Global decl -> {n with v = Global (pass_decl decl)}
| Func(name,signature,ret,blk) ->{ n with v = Func(name,signature,ret,(pass_block blk)) }
and pass_block blk = List.map (fun n -> {n with v = pass_statement n.v}) blk
and pass_statement = function
| Decl decls -> Decl (List.map pass_decl decls)
| Block blk -> Block (pass_block blk)
| For(a,b,c,blk) -> For ((pass_stmt_option a),b,(pass_stmt_option c), (pass_block blk))
| If cases -> If (List.map pass_case cases)
| Switch(a,b,cases) -> Switch (pass_statement a, b, (List.map pass_fallable_case cases))
| any -> any
(* Here we could put in some sanitization that there is no repeated assignment *)
and pass_stmt_option = function
| None -> None
| Some stmt -> Some (pass_statement stmt)
and pass_case = function
| Case(stmt,exprs,block) -> Case(pass_statement stmt, exprs, pass_block block)
| Default block -> Default(pass_block block)
and pass_fallable_case = function
| (case,mode) -> (pass_case case,mode)
and pass_decl = function
    | Var({v = `V _}, _,_,false) | Var({v = `Blank},_,_,false) | Var({v = `V _}, _,_,true) | Var({v = `Blank},_,_,true) as ok -> ok
    | Var(any, _, _, false) | Var(any, _, _, true) -> raise (SyntaxError ("In typed/short variable declaration, unexpected " ^ (Pretty.string_of_lvalue' any) ^ " is not an identifier.")) 
    | any -> any (* other kinds of declarations do not need to be weeded right now *) 
