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
let arr_map : (string,string) Hashtbl.t = Hashtbl.create 50

let temp_var_count = ref 0
let tmp_count () =
  incr temp_var_count;
  string_of_int !temp_var_count

(* had to copy this from Codegen because I was getting weird
circular dep errors - can look into fixing this later *)
let rec typ_string typ = match typ with
  | `BOOL
  | `INT          -> "int"
  | `RUNE         -> "char"
  | `FLOAT64      -> "float"
  | `STRING       -> "char*"
  | `Type(id)     -> id (* TODO: we want to print the resolved type here *)
  | `AUTO         -> "" (* this shouldn't be reached, probably want to throw an error *)
  | `VOID         -> "void"
  | `TypeLit(t)   -> typelit_string t
and typelit_string typlit = match typlit with
  | Slice(typ)    -> "__golite_builtin__slice"
  | Array(i, typ) -> Hashtbl.find struct_map (hash_array i typ)
  | Struct(fields)  -> Hashtbl.find struct_map (hash_struct fields)
and add_struct_entry fields =
  let struct_string = hash_struct fields in
  let struct_name = "__golite__struct_" ^ tmp_count () in
  Printf.printf "%s - > %s\n" struct_string struct_name; Hashtbl.add struct_map struct_string struct_name
and hash_struct fields = List.fold_right (fun field acc -> (hash_field field) ^ "," ^ acc) fields ""
and hash_field field = match field with
  | (iden', typ) -> (match iden', typ with
    | `V(id), `TypeLit typlit -> (match typlit with
      | Struct(fields) ->
        add_struct_entry fields;
        let struct_string = hash_struct fields in
        let struct_name = Hashtbl.find struct_map struct_string in
        Printf.sprintf "%s~%s" struct_name id
      | Array(size,typ) ->
        add_arr_entry size typ;
        let struct_string = hash_array size typ in
        let struct_name = Hashtbl.find arr_map struct_string in
        Printf.sprintf "%s~%s" struct_name id
      | _ -> Printf.sprintf "%s~%s" (typelit_string typlit) id
    )
    | `V(id), _ -> Printf.sprintf "%s~%s" (typ_string typ) id
    | _,_ -> "" (* this shouldn't be reached, might want to throw an error *)
  )
and add_arr_entry size typ = 
  let struct_string = hash_array size typ in
  let struct_name = Printf.sprintf "__golite_arr_%s_%d" (typ_string typ) size in
  Printf.printf "%s - > %s\n" struct_string struct_name; Hashtbl.add arr_map struct_string struct_name
and hash_array size typ = Printf.sprintf "%s~%d" (typ_string typ) size


let rec codepre_ast ast = match ast with
  | Program(pkg, toplvllist) -> List.iter codepre_toplvl toplvllist
and codepre_toplvl toplvl = match toplvl.v with
  | Global(decl) -> codepre_decl decl
  | Func(iden', siglst, typ, block) -> codepre_block block
and codepre_block block = List.iter codepre_stmt block
and codepre_stmt stmt = match stmt.v with
  | Decl(declist) -> List.iter codepre_decl declist
  | _ -> ()
and codepre_decl decl = match decl with
  | Var(_,typ,_,_) -> codepre_typ typ
  | Type(iden', typ) -> codepre_typ typ
and codepre_typ typ = match typ with
  | `TypeLit(Struct(fields)) -> add_struct_entry fields
  | `TypeLit(Array(size,typ)) -> add_arr_entry size typ
  | _ -> ()
