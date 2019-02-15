open Lexer
open Parser
open Golite

let dump_ast = function
| INT ->  "int"

let dump_token = function
| EOF -> ""

let dump_tokens lexfun buf =
	let rec collect acc =
		match (lexfun buf) with
		| EOF -> List.rev acc
		| t -> collect ((dump_token t)::acc)
	in String.concat "\n" (collect [])

