open Sexplib


let dump_type typ = Golite.sexp_of_gotype typ |> Sexp.to_string_hum

let dump ast = 
	Golite.sexp_of_ast ast |> Sexp.to_string_hum
let dump_statement stmt = Golite.sexp_of_statement_node stmt |> Sexp.to_string_hum
