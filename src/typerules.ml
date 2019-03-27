open Golite
open Printf
open Typelib

(*** Typerules holds type logic for specific cases in the Golite spec, 
      just to avoid cluttering up typecheck.ml ***)


let return_type symt ident = match ident.v with 
	| `V id ->
		assert_kinds symt "function call" id kind_callable;
		List.hd (resolve_basic symt (typeof_symbol symt id))
  	| other -> failwith "Mystery meat callable (check return_type function)"

(* Same as element_type, but only accepts a slice. used in append *)    
let slice_type symt node =    
	let element_type_error () = 
		sprintf "Expression %s of type %s (i.e. %s) is not a slice %s\n"
			(Pretty.string_of_expr node)
			(string_of_typesig (typeof node))
			(string_of_typesig (rt symt (typeof node)))
			(err_loc node)
    in match (rt symt (typeof node)) with
	| [`TypeLit Slice typ] -> [typ]
    | other -> raise (TypeError (element_type_error ()))

let element_type symt node = 
	let element_type_error () = 
		sprintf "Expression %s of type %s (i.e. %s) is not indexable %s\n"
			(Pretty.string_of_expr node)
			(string_of_typesig (typeof node))
			(string_of_typesig (rt symt (typeof node)))
			(err_loc node)
	in match (rt symt (typeof node)) with
	| [`TypeLit Slice typ] -> [typ]
	| [`TypeLit Array(sz,typ)] -> [typ]
	| other -> raise (TypeError (element_type_error ()))

let field_type symt node field = 
	let field_not_found_error () = 
		sprintf "Field %s does not exist in struct %s of type %s %s\n"
			field
			(Pretty.string_of_expr node)
			(string_of_typesig (typeof node))
			(err_loc node)
	in let not_a_struct_error () = 
		sprintf "Expression %s of type %s (i.e. %s) is not selectable %s\n"
			(Pretty.string_of_expr node)
			(string_of_typesig (typeof node))
			(string_of_typesig (rt symt (typeof node)))
			(err_loc node)
	in let search_struct typedef field =
		let find_mem = function
			| (`V name, typ) -> name = field
			| (`Blank, typ) -> false
		in match List.find_opt find_mem typedef with
		| Some (_,typ) -> Some (resolve_basic symt [typ])
		| None -> None
	in let structtype = (rt symt (typeof node)) in
		match structtype with
		| [`TypeLit Struct ms] -> 
			begin match search_struct ms field with
            | Some fieldtype -> fieldtype
			| None -> raise (TypeError (field_not_found_error ()))
			end
		| other -> raise (TypeError (not_a_struct_error ()))

let assert_not_void ctx symt (node, typ) =
	let void_invalid_error () =
		sprintf "In %s, expression %s has type VOID, but a non-void expression is required %s"
		ctx
		(Pretty.string_of_expr node)
		(err_loc node)
	in let non_value_error () = 
		sprintf "In %s, expression %s has function type %s, but a value-typed expression is required %s"
		ctx
		(Pretty.string_of_expr node)
		(Typelib.string_of_typesig typ)
		(err_loc node)
	in if  List.length typ <> 1 then
		raise (TypeError (non_value_error ()))
	else if (resolve_basic symt typ) = [`VOID] then
		raise (TypeError (void_invalid_error ()))




let save_inferred_type (sym:Symtbl.symbol) inferred = 
	sym.typ <- inferred

let assert_redef_match symt node lhs rt =
	let redef_error name =
		sprintf "Variable %s must not be redeclared as %s %s. Previously declared as %s."
			name
			(string_of_typesig rt)
			(err_loc node)
			(string_of_typesig (typeof_symbol symt name))
	in let search_conflicts name = 
		match Symtbl.get_symbol symt name true with
		| Some sym -> 
			let lt' = (infer_auto sym.typ rt) in
				if (resolve_basic symt lt') <> (resolve_basic symt rt) then
				raise (TypeError (redef_error name))
				else save_inferred_type sym rt
		| None -> ()
	in match lhs.v with
	| `V name -> search_conflicts name
	| `Blank -> ()
	| _ -> failwith "Weeding failed to remove non-identifier from variable declaration"

