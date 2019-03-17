open Golite
open Printf
exception TypeError of string


let raise_type node lt rt =
	let l0,c0 = node._start in
	let l1,c1 = node._end in 
		raise (TypeError (sprintf "Types %s and %s are incompatible in %s on line %d, cols %d-%d\n" 
			(Dumpast.dump_type lt)
			(Dumpast.dump_type rt)
			"<some node>"
			l0 c0 c1))

(* Performs a very limited resolution strategy which accomodates identifiers like 
   `Type "int" which are still associated with their appropriate basic type like `Int
 *)

let maybe_basic = function
| "int" -> Some `INT
| "float64" -> Some `FLOAT64
| "string" -> Some `STRING
| "rune" -> Some `RUNE
| "bool" -> Some `BOOL
| _ -> None



let typeof_ident symt var = match (Symtbl.get_symbol symt var true) with
| Some sym -> sym.typ
| None -> raise (SyntaxError "We are all going to die!!!")

let rec resolve_basic symt = function
| (`Type id) as tref ->
	begin match maybe_basic id with  
	| Some legit_typ -> 
		let alias_typ = List.hd (typeof_ident symt id) in
			if legit_typ = alias_typ
		 	then legit_typ
			else tref
	| None -> tref
	end
| `TypeLit Slice typ -> `TypeLit (Slice (resolve_basic symt typ))
| `TypeLit Array(sz, typ) -> `TypeLit (Array(sz, resolve_basic symt typ))
| `TypeLit Struct(ms) -> `TypeLit(Struct(List.map (fun (i,t) -> (i,resolve_basic symt t)) ms))
| rest -> rest

let assert_match symt node lt rt = 
	if (resolve_basic symt lt) <> (resolve_basic symt rt) then
		raise_type node lt rt
		

let descend = function
| Symtbl.Symt(_,_,children,_) -> List.map (fun r -> !r) children

let typeof node = node._derived


let rec pass_ast symt = function
| Program(pkg,tops) -> Program(pkg, List.map (pass_toplevel symt) tops)
and pass_toplevel symt node = {node with v = match node.v with
| Global decl -> Global(pass_decl symt {node with v = decl})
| x -> x}
and pass_decl symt node = match node.v with
| Var(name, `AUTO, Some expr, s) ->
	let expr' = pass_expr symt expr in
		Var(name, typeof expr', Some expr', s)
| Var(name, lt, Some expr, s) ->
	let expr' = pass_expr symt expr in
		assert_match symt node lt (typeof expr');
		Var(name, lt, Some expr', s)
| other -> other
and pass_expr symt node = match node.v with
| `L lit -> {node with _derived = typeof_literal lit}
| `V var -> {node with _derived = List.hd (typeof_ident symt var)} 
and typeof_literal = function
| Int _ -> `INT
| Float64 _ -> `FLOAT64
| Rune _ -> `RUNE
| String _ -> `STRING
| Bool _ -> `BOOL
