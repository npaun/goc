open Sexplib

let dump ast = 
	Golite.sexp_of_ast ast |> Sexp.to_string_hum
