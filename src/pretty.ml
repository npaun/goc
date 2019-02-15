open Lexer
open Parser
open Golite

let dump_ast = function
| Hello ->  "Hello World"

let dump_token = function
| HELLO -> "HELLO"	
| EOF -> ""

let dump_tokens lexfun buf =
	let rec collect acc =
		match (lexfun buf) with
		| EOF -> List.rev acc
		| t -> collect ((dump_token t)::acc)
	in String.concat "\n" (collect [])

