open Golite

exception CodePreErr of string

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
let slice_set = ref []

let struct_decls = ref []

let temp_var_count = ref 0
let tmp_count () =
  incr temp_var_count;
  string_of_int !temp_var_count

(* splits struct string into a list of field strings - type~id *)
let get_fields struct_string = List.filter (fun s -> String.length s <> 0) (String.split_on_char ',' struct_string) 

(* splits a field string into a tuple (type,id) *)
let split_field field = 
  let split = String.split_on_char '~' field in
  (List.nth split 0, List.nth split 1)

(* given a list of field strings it returns a list of (type,id) tuples *)
let tup_fields fields = List.map split_field fields 

let gen_struct struct_string struct_name =
  let fields = tup_fields (get_fields struct_string) in
  "typedef struct {\n" ^
  String.concat ";\n" (List.map (fun (typ,id) -> "\t" ^ typ ^ " __" ^ id) fields) ^
  ";\n} " ^ struct_name ^ ";\n\n"

let gen_array struct_string struct_name =
  let (typ,size) = split_field struct_string in
  "typedef struct {\n" ^
  Printf.sprintf "\t%s data[%s];\n} %s;\n\n" typ size struct_name

let gen_slice typ_s = 
  "typedef struct {\n" ^
  "\tunsigned int __size;\n" ^
  "\tunsigned int __capacity;\n" ^
  Printf.sprintf "\t%s* __contents ;\n" typ_s ^
  Printf.sprintf "} __golite_builtin__slice_%s;\n\n" typ_s


(*
  generates a comparison function for each generated struct. Ex:

  typedef struct {
    int i;
    float f;
    char* s;
    __golite__arr_int_100 arr;
  } struct_1;

  bool struct_1_cmp(struct_1* p, struct_1* q) {
    return (p->i == q-> i) && (p->f == q->f) && (strcmp(p->s,q->s) == 0) && __golite__arr_int_100_cmp(&p->arr,&q->arr);
  }
*)
let get_struct_cmp_string (typ,id) =
  let len = String.length typ in
  if len >= 13 && String.equal (String.sub typ 0 13) "__golite__arr" then Printf.sprintf "%s_cmp(&p->__%s,&q->__%s)" typ id id
  else if len >= 16 && String.equal (String.sub typ 0 16) "__golite__struct" then Printf.sprintf "%s_cmp(&p->__%s,&q->__%s)" typ id id
  else if len >= 23 && String.equal (String.sub typ 0 23) "__golite_builtin__slice" then "false" (* slices have no comparison so this doesnt matter*)
  else if String.equal typ "char*" then Printf.sprintf "(strcmp(p->__%s,q->__%s) == 0)" id id
  else Printf.sprintf "(p->__%s == q->__%s)" id id

let get_arr_cmp_string (typ,id) =
  let len = String.length typ in
  if len >= 13 && String.equal (String.sub typ 0 13) "__golite__arr" then Printf.sprintf "%s_cmp(&p->data[i],&q->data[i])" typ 
  else if len >= 16 && String.equal (String.sub typ 0 16) "__golite__struct" then Printf.sprintf "%s_cmp(&p->data[i],&q->data[i])" typ
  else if len >= 23 && String.equal (String.sub typ 0 23) "__golite_builtin__slice" then "false" (* slices have no comparison so this doesnt matter *) 
  else if String.equal typ "char*" then "(strcmp(p->data[i],q->data[i]) == 0)" 
  else "(p->data[i] == q->data[i])" 

let gen_struct_cmp struct_string struct_name =
  let fields = tup_fields (get_fields struct_string) in
  let comps = String.concat " && " (List.map get_struct_cmp_string fields) in
  (Printf.sprintf "bool %s_cmp(%s* p, %s* q) { \n" struct_name struct_name struct_name) ^ 
  "\treturn " ^ (if comps <> "" then comps else "true") ^
  ";\n}\n\n"

let gen_arr_cmp struct_string struct_name = 
  let (typ,size) = split_field struct_string in
  (Printf.sprintf "bool %s_cmp(%s* p, %s* q) { \n" struct_name struct_name struct_name) ^
  (Printf.sprintf "\tfor(int i = 0; i < %s; i++) {\n" size) ^
  (Printf.sprintf "\t\tif(!%s) return false;\n" (get_arr_cmp_string (typ,struct_name))) ^ "\t}\n" ^ "\treturn true;\n}\n\n"

let get_init_string typ =
  if String.equal typ "char*" then "string_init"
  else typ ^ "_init"

let gen_struct_init struct_string struct_name =
  let gen_field_init (typ,id) = Printf.sprintf "\t%s(&x->__%s);\n" (get_init_string typ) id in
  let fields = tup_fields (get_fields struct_string) in
  (Printf.sprintf "void %s_init(%s* x) {\n" struct_name struct_name) ^
  (String.concat "" (List.map gen_field_init fields)) ^ "}\n\n"

let gen_array_init struct_string struct_name =
  let (typ,size) = split_field struct_string in
  (Printf.sprintf "void %s_init(%s* x) {\n" struct_name struct_name) ^
  (Printf.sprintf "\tfor(int i = 0; i < %s; i++) {\n" size) ^
  (Printf.sprintf "\t\t%s(&x->data[i]);\n" (get_init_string typ)) ^ "\t}\n}\n"

let gen_slice_init typ_s = 
  (Printf.sprintf "void __golite_builtin__slice_%s_init(__golite_builtin__slice_%s* x) {\n" typ_s typ_s) ^
  "\tx->__size = 0;\n" ^
  "\tx->__capacity = 0;\n" ^
  "\tx->__contents = NULL;\n" ^
  "}\n\n"

let gen_slice_app typ_s =
  let slice_name = "__golite_builtin__slice_" ^ typ_s in
  (Printf.sprintf "%s %s_append(%s* _s, %s el) {\n" slice_name slice_name slice_name typ_s) ^
  (Printf.sprintf "\t%s s;\n" slice_name) ^ 
  ("\ts.__size = _s->__size;\n") ^ 
  ("\ts.__capacity = _s->__capacity;\n") ^ 
  ("\ts.__contents = _s->__contents;\n") ^ 
  "\tif( s.__contents == NULL || s.__size + 1 > s.__capacity) {\n" ^
  "\t\ts.__capacity = (s.__capacity + 1) * 2;\n" ^
  (Printf.sprintf "\t\t%s* new_arr = (%s*)malloc((s.__capacity) * sizeof(%s));\n" typ_s typ_s typ_s) ^
  (Printf.sprintf "\t\tmemcpy(new_arr, _s->__contents, s.__size * sizeof(%s));\n" typ_s) ^
  "\t\ts.__contents = new_arr;\n" ^
  "\t}\n" ^
  "\ts.__contents[s.__size++] = el;\n" ^
  "\treturn s;\n}\n\n"

let gen_slice_index typ_s = 
  let slice_name = "__golite_builtin__slice_" ^ typ_s in
  (Printf.sprintf "%s* %s_index(%s s, int i) {\n" typ_s slice_name slice_name) ^
  "\tif(i >= 0 && i < s.__size) return s.__contents;\n" ^
  "\telse { fprintf(stderr, \"Out of Bounds index on slice\\n\"); exit(-1); }\n}\n\n" 

let gen_slice_len typ_s = 
    let slice_name = "__golite_builtin__slice_" ^ typ_s in
    (Printf.sprintf "int %s_len(%s s) {\n" slice_name slice_name) ^
    "\treturn s.__size;\n" ^
    "}\n\n" 
    
let gen_slice_cap typ_s = 
    let slice_name = "__golite_builtin__slice_" ^ typ_s in
    (Printf.sprintf "int %s_cap(%s s) {\n" slice_name slice_name) ^
    "\treturn s.__capacity;\n" ^
    "}\n\n" 


let gen_struct_fns struct_string struct_name = [gen_struct struct_string struct_name; gen_struct_cmp struct_string struct_name; gen_struct_init struct_string struct_name]
let gen_arr_fns struct_string struct_name = [gen_array struct_string struct_name; gen_arr_cmp struct_string struct_name; gen_array_init struct_string struct_name]
let gen_slice_fns typ_s = [gen_slice typ_s; gen_slice_init typ_s; gen_slice_app typ_s; gen_slice_index typ_s; gen_slice_len typ_s; gen_slice_cap typ_s]

let rec typ_string typ = match typ with
  | `BOOL
  | `INT          -> "int"
  | `RUNE         -> "char"
  | `FLOAT64      -> "double"
  | `STRING       -> (*"char*"*) "string"
  | `Type(id)     -> id (* TODO: we want to print the resolved type here *)
  | `AUTO         -> "" (* this shouldn't be reached, probably want to throw an error *)
  | `VOID         -> "void"
  | `TypeLit(t)   -> typelit_string t
and typelit_string typlit = match typlit with
  | Slice(typ)    -> "__golite_builtin__slice_" ^ (typ_string typ)
  | Array(i, typ) -> (match Hashtbl.find_opt arr_map (hash_array i typ) with
    | Some s -> s
    | None -> raise (CodePreErr (Printf.sprintf "Unable to find entry in arr_map: %s" (hash_array i typ)))
  )
  | Struct(fields)  -> (match Hashtbl.find_opt struct_map (hash_struct fields) with
    | Some s -> s
    | None -> raise (CodePreErr (Printf.sprintf "Unable to find entry in struct_map: %s" (hash_struct fields)))
  )
and typ_string_arr typ = match typ with
  | `STRING -> "string"
  | _ -> typ_string typ
and add_struct_entry fields =
  let struct_string = hash_struct fields in
  let struct_name = "__golite__struct_" ^ tmp_count () in
  match Hashtbl.find_opt struct_map struct_string with
  | Some s -> ()
  | None -> 
      struct_decls := !struct_decls@gen_struct_fns struct_string struct_name;
      Hashtbl.add struct_map struct_string struct_name;
and get_typlit_name typlit = match typlit with
  | Struct(fields) ->
    add_struct_entry fields;
    let struct_string = hash_struct fields in
    let struct_name = Hashtbl.find struct_map struct_string in
    struct_name 
  | Array(size,typ) ->
    add_arr_entry size typ;
    let struct_string = hash_array size typ in
    let struct_name = Hashtbl.find arr_map struct_string in
    struct_name 
  | Slice(typ') ->
    add_slice_entry typ';
    Printf.sprintf "__golite_builtin__slice_%s" (typ_string typ')
and hash_struct fields = List.fold_right (fun field acc -> (hash_field field) ^ "," ^ acc) fields ""
and hash_field field = match field with
  | (iden', typ) -> (match iden', typ with
    | `V(id), `TypeLit typlit -> Printf.sprintf "%s~%s" (get_typlit_name typlit) id
    | `V(id), _ -> Printf.sprintf "%s~%s" (typ_string typ) id
    | _,_ -> "" (* this shouldn't be reached, might want to throw an error *)
  )
and add_arr_entry size typ = 
  let struct_string = hash_array size typ in
  let struct_name = Printf.sprintf "__golite__arr_%s_%d" (typ_string_arr typ) size in
  match Hashtbl.find_opt arr_map struct_string with 
  | Some s -> ()
  | None -> 
    struct_decls := !struct_decls@gen_arr_fns struct_string struct_name;
    Hashtbl.replace arr_map struct_string struct_name
and hash_array size typ = match typ with
  | `TypeLit typlit -> Printf.sprintf "%s~%d" (get_typlit_name typlit) size 
  | _ -> Printf.sprintf "%s~%d" (typ_string typ) size
and add_slice_entry typ = 
  let typ_s = typ_string typ in
  if not (List.exists (fun t -> String.equal t typ_s) !slice_set) then (
    slice_set := !slice_set@[typ_s];
    struct_decls := !struct_decls@gen_slice_fns typ_s
  )

let global_vars = ref []
let add_globalvar_entry iden' typ expr_opt = global_vars := !global_vars@[(iden',typ,expr_opt)]

let init_blocks = ref []

let rec codepre_ast ast = match ast with
  | Program(pkg, toplvllist) -> List.iter codepre_toplvl toplvllist
and codepre_toplvl toplvl = match toplvl.v with
  | Global(decl) -> codepre_decl true decl
  | Func(iden', siglst, typ, block) -> (match iden' with 
        | `V(id) -> 
          if String.equal id "init" then init_blocks := !init_blocks@[block];
          codepre_block block;
        | _ -> codepre_block block;
    )
and codepre_block block = List.iter codepre_stmt block
and codepre_stmt stmt = match stmt.v with
  | Decl(declist) -> List.iter (codepre_decl false) declist
  | _ -> ()
and codepre_decl isglobal decl = match decl with
  | Var(iden',typ, expr_opt, isshort) -> if isglobal then add_globalvar_entry iden' typ expr_opt; codepre_typ typ
  | Type(iden', typ) -> codepre_typ typ
and codepre_typ typ = match typ with
  | `TypeLit(Struct(fields)) -> add_struct_entry fields
  | `TypeLit(Array(size,typ')) -> codepre_typ typ'; add_arr_entry size typ'
  | `TypeLit(Slice(typ')) -> codepre_typ typ'; add_slice_entry typ'
  | _ -> ()
