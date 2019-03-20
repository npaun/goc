open Golite
open Printf
open Symtbl

exception TypeError of string
(***
 Typelib provides functions to perform basic operations using the symbol table, AST  and typing rules. 
 ***)

(** typesig: The internal form of a function or variable signature, designed to be easy to transform.
              Think of this as equivalent to the JVm internal signatures.
	      The format is:
	      [return-type; arg1; arg2; ...; argn]
	      Signature for a simple value is only
	      [type]
	      And for a no-argument function it is
	      [return-type; `VOID] **)
type typesig = gotype list

(** string_of_typesig formats a type signature with sufficient precision
    to be helpful to a user in resolving type issues. **)
let string_of_typesig = Dumpast.dump_types


(** typeof: Derived type of any AST node. **)
let typeof (node:'n annotated):typesig = 
	node._derived


(** typeof_symbol: Current type of an symbol from the symbol table
		   Perhaps, this function should not be different from typeof, but since we do ocassionally
		   update the symbol table during typechecking this is easier. **)
let typeof_symbol (symt:symtbl) (ident:identifier):typesig = 
	match (Symtbl.get_symbol symt ident true) with
	| Some sym -> sym.typ
	| None -> failwith "Probable bug in Symtbl: Attempt to access non-existent symbol"


(** typeof_literal: Maps between the variant of a literal and the corresponding internal type **)

let typeof_literal = function
| Int _ -> `INT
| Float64 _ -> `FLOAT64
| Rune _ -> `RUNE
| String _ -> `STRING
| Bool _ -> `BOOL

(** descend: Extricates all the child symbol tables from the current one **)
let descend = function
| Symtbl.Symt(_,_,children,_) -> List.map (fun chld -> !chld) children

(** traverse: Traverse an AST and associated symbol table, managing popping child scopes automatically. Arguments to the left of ** are given to your pass function while those to the right keep internal state for the traverse scheme
	      This code is rather tricky to understand. **)
type 'n traverse_scheme = symtbl -> 'n annotated -> 'n -> 'n annotated list -> symtbl option -> symtbl list -> ('n annotated list * symtbl list)


let traverse (fn:'n traverse_scheme) (symt:symtbl) (nodes:'n annotated list):'n annotated list = 
	let aux this_symt (node, child_symts) node =
		match child_symts with
		| h::t -> (fn this_symt node node.v) nodes (Some h) t
		| [] -> 
			(** no more children in this block. Can only use same for the rest of the nodes **)
			(fn this_symt node node.v) nodes None []
	in let nodes, _ = List.fold_left (aux symt) ([], (descend symt)) nodes
	in nodes |> List.rev

(** same: Process a node which does not create a new scope **)
let same (fn:unit -> 'n annotated) (nodes: 'n annotated list) (child:symtbl option) (children:symtbl list):('n annotated list * symtbl list) = 
	match child with
	| Some c -> (fn ())::nodes, c::children
	| None -> (fn ())::nodes, children

(** down: Recurse into a new scope, and remove it from the list of univsited scopes **)
let down (fn:symtbl -> 'n annotated) (nodes: 'n annotated list) (child:symtbl option) (children:symtbl list):('n annotated list * symtbl list) = 
	match child with
	| Some c -> (fn c)::nodes, c::children
	| None -> failwith "Probable bug in Symtbl or Typecheck: Attempt to recurse when no more blocks left in current scope"

(** resolve_fn: A type of function which can simplify a typesig according to an inference rule. **)
type resolve_fn = symtbl -> typesig -> typesig

let resolve_visitor fn symt typs = 
	let rec aux = function
	| `Type id -> fn symt id
	| `TypeLit Slice typ -> `TypeLit (Slice (aux typ))
	| `TypeLit Array(sz, typ) -> `TypeLit (Array(sz, aux typ))
	| `TypeLit Struct(members) -> 
		let members' = List.map (fun (field, typ) -> (field, aux typ)) members
		in `TypeLit (Struct (members'))
	|  basic -> basic
	in List.map aux typs

(** resolve_basic: Determine whether a user-specified type refers to a fundamental basic type. 
		This function is necessary because special properties of the built-in types are 
		defined in terms of basic types (like `INT or `RUNE), while users can only refer 
		to type identifiers (like `Type "int"). The correspondence between the identifier 
		and the basic type may be destroyed by shadowing the type declaration (e.g. type int [6]string). 
		Furthermore, a chain of shadowing that points back to the original (e.g. type weasel int; type int weasel)
		cannot restore the built-in behaviour of the basic type. It is unclear whether 
		redefining a type back to its built-in definition by some means restores the built-in 
		functionality.
		
		resolve_basic traverses through 'compound types' like structs and slices.
		This function should generally be called when the Golite spec does not call for the use of RT. 
		Try not to call it multiple times in a row though this is harmless. *) 
let resolve_basic (symt:symtbl) (typs:typesig):typesig = 
	let basic_type_of_ident = function
	| "int" -> Some `INT
	| "float64" -> Some `FLOAT64
	| "rune" -> Some `RUNE
	| "string" -> Some `STRING
	| "bool" -> Some `BOOL
	| _ -> None
	in let replace_basic symt id =
		match basic_type_of_ident id with
		| Some legit_typ ->
			let alias_typ = typeof_symbol symt id |> List.hd in
				if legit_typ = alias_typ 
					(* Identifier not shadowed *)	 
 					then legit_typ
					(* Identifier is shadowed, kept as reference to type. We could concievably use its definition but not needed *)
					else `Type id
		| None -> `Type id (* truly a user-defined type *)
	in resolve_visitor replace_basic symt typs

(** infer_auto: Replace the LHS type with the RHS type if auto **)
let infer_auto ltyp rtyp = match ltyp with
| [`AUTO] -> rtyp
| _ -> ltyp


(** RT ("resolve type") is defined in the Golite specs. It continues to substitute 
	the definition of types until arriving at the most basic definition, in 
	terms of built-in types and compounds (e.g. structs, arrays).
 	It should be used almost always, only when "RT" is specifically called 
	for in the specs. **)
let rec rt (symt:symtbl) (typs:typesig):typesig = 
	let aux symt id = 
		typeof_symbol symt id 
		|> rt symt (* rt will stop once a basic type is hit *)
		|> resolve_basic symt (* for built-ins which expect the basic types *)
		|> List.hd (* single value only *)
	in resolve_visitor aux symt typs

(** err_loc: Provides a textual explanation of the error location to substitute into messages.**)
let err_loc node =
	let l0,c0 = node._start in
	let l1,c1 = node._end in
		sprintf "at line %d, cols %d-%d" l0 c0 c1


(** assert_match: Require that two types match each other. The resolver is 
	selectable depending on whether strict matching or deep resolution is required.
	The ltyp may be `AUTO, in which case it will be inferred to be rtyp.
	Error messages assume that you can provide a string which identifies the incompatible 
	LHS (e.g. variable name, built-in function, etc.); an expression which gives rise to 
	the incompatible RHS; and a string explaining in one word or two what operation has
	caused this check to fail (e.g. assignment, indexing). Error contexts are rather rigid
	but it is difficult to handle all the potential pretty prints. **)

let assert_match resolver symt ctxstring (lstring,ltyp) (rnode,rtyp) =
	let match_error () =
		sprintf "In %s, expression '%s' of type %s is incompatible with '%s' of type %s %s\n" 
		ctxstring
		(Pretty.string_of_expr rnode) (string_of_typesig rtyp)
		lstring (string_of_typesig ltyp)
		(err_loc rnode)
	in let ltyp' = infer_auto ltyp rtyp in (* If ltyp = `AUTO, use rtyp *)
		if (resolver symt ltyp') <> (resolver symt rtyp) then
			raise (TypeError (match_error ()))


(** assert_consist: Require that the type of some RHS matches a previous declaration of an identifier.
	Error messages assume that the rnode is an expression. Hopefully this will always work. **)
let assert_consist resolver symt ident (rnode,rtyp) = 
	let inconsistency_error ident_str declared_as used_as =
		sprintf "Declared type of '%s' is %s, but expression '%s' is of type %s %s\n"
		ident_str (string_of_typesig declared_as)
		(Pretty.string_of_expr rnode) (string_of_typesig used_as)
		(err_loc rnode)
	in match ident.v with
	| `V id -> (* A bit odd that we take the whole ident node, might change *)
		let ltyp = resolver symt (typeof_symbol symt id) in
		let basic_rtyp = resolver symt rtyp in
			if ltyp <> basic_rtyp then
			raise (TypeError (inconsistency_error id ltyp basic_rtyp))
	| _ -> failwith (sprintf "Please check if '%s' makes sense with assert_consist and enhance this function" (Pretty.string_of_expr ident))



(** assert_kinds: Require that the type of some symbol belong to the appropriate kinds. You probably want to use one of the predefined 'kinds'**)

let kind_callable = ("a callable value",[FuncK])
let kind_var = ("a variable",[VarK;ConstK])
let kind_nonconst = ("a non-constant variable",[VarK])

let assert_kinds symt ctxstring id (class_name,class_members) = 
	let kind_error () = 
		sprintf "In %s, illegal reference to '%s'; expected %s\n"
			ctxstring
			id
			class_name
	in match (Symtbl.get_symbol symt id true) with
	| Some sym ->
		if not (List.mem sym.kind class_members) then
			raise (TypeError (kind_error ()))
	| None -> failwith "Probable bug in Symtbl - reference to non-existent symbol"


(** type_single: Provides the raw type of a value. Exception if misused **)
let type_single (node:'n annotated):gotype = 
	match (typeof node) with
	| [valtyp] -> valtyp
	| _ -> failwith "Probable bug in Typecheck: Attempt to obtain a single type for a function or unprocessed object"


(** fwd_annot: 'Forwards' the annotation of a parent node to a child,
		so that a child-specific typechecking function has the necessary info.
		Calling this function is most likely a sign that the annotation is not attached to the 
		appropriate node, but oh well. **)
let fwd_annot (parent:'n annotated) (child:'m):('m annotated) =
	{parent with v = child}
