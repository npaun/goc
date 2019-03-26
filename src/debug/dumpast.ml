open Sexplib
open Printf

let dump_types typs = 
	match typs with
	| h::t -> 
		List.map (fun typ -> Golite.sexp_of_gotype typ |> Sexp.to_string_hum) (t @ [h]) 
		|> String.concat " -> "
	| [] -> "<VOID>"


let rec dump_symtbl = function
| Symtbl.Symt(binds,_,childs,_) ->
	let l1 = Hashtbl.to_seq binds |> Seq.map (fun (k,v) -> k) |> List.of_seq |> String.concat "; " in
		let ls = List.map (fun c -> dump_symtbl !c) childs in
			String.concat "\n> " (l1::ls)

let dump ast = 
	Golite.sexp_of_ast ast |> Sexp.to_string_hum
let dump_statement stmt = Golite.sexp_of_statement_node stmt |> Sexp.to_string_hum
