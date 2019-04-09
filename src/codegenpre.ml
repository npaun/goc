open Golite


(*
  The general approach to generating structs is as follows:

  Iterate through the AST and do the following when we encounter
  a struct being defined:
  1. scan fields of the struct and check for child structs, if any exist
     generate them first (recursive call)
  2. Hash the struct into a string, using the following convention:
     field1type~field1identifier,field2type~field2identifier ...
     EX:
     type person struct {
       name string
       age int
     }
     -> string~name,int~age

     type parent struct {
       name string
       child struct {
         name string
         age int
       }
     }
     child: string~name,int~age -> struct_0
     parent: string~name,struct_0~child

     TODO write about child struct string
  3. If a struct with that hash string doesn't exist, generate a new
    unique name for the struct and map the hashed string to the struct name.
  
  Once we have traversed the entire AST, we are left with a list
  of hashed strings for all of the structs defined in the source file, each
  of which map to a unique struct name. We can then generate corresponding 
  structs in C by iterating through these strings.  
*)

let struct_map : (string,string) Hashtbl.t = Hashtbl.create 50

(* had to copy this from Codegen because I was getting weird
circular dep errors - can look into fixing this later *)
let rec gen_typ typ = match typ with
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
  | Slice(typ)    -> "__golite_builtin__slice"
  | Array(i, typ) -> gen_typ typ ^ Printf.sprintf "[%d]" i
  | Struct(mems)  -> "struct" (* TODO *)

let temp_var_count = ref 0
let tmp_count () =
  incr temp_var_count;
  string_of_int !temp_var_count

let rec structg_decl decl = match decl with
  | Var(_,typ,_,_) -> structg_typ typ
  | Type(iden', typ) -> structg_typ typ
and structg_typ typ = match typ with
  | `TypeLit(Struct(fields)) -> add_struct_entry fields
  | _ -> ()
and add_struct_entry fields =
  let struct_string = hash_struct fields in
  let struct_name = "struct_" ^ tmp_count () in
  Printf.printf "%s\n" struct_string; Hashtbl.add struct_map struct_string struct_name
and hash_struct fields = List.fold_right (fun field acc -> (hash_field field) ^ "," ^ acc) fields ""
and hash_field field = match field with
  | (iden', typ) -> (match iden', typ with
    | _, `TypeLit typlit -> "" (* TODO *)
    | `V(id), _ -> Printf.sprintf "%s~%s" (gen_typ typ) id
    | _,_ -> ""
  )

let rec codepre_ast ast = match ast with
  | Program(pkg, toplvllist) -> List.iter codepre_toplvl toplvllist
and codepre_toplvl toplvl = match toplvl.v with
  | Global(decl) -> structg_decl decl
  | Func(iden', siglst, typ, block) -> codepre_block block
and codepre_block block = List.iter codepre_stmt block
and codepre_stmt stmt = match stmt.v with
  | Decl(declist) -> List.iter structg_decl declist
  | _ -> ()

