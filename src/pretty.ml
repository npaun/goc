open Lexer
open Parser
open Golite

let dump_ast = function
| _ -> "not implemented"

let dump_token = function
	| BREAK					-> "BREAK"
	| DEFAULT				-> "DEFAULT"
	| FUNC 					-> "FUNC"
	| INTERFACE 		-> "INTERFACE"
	| SELECT				-> "SELECT"

	| CASE					-> "CASE"
	| DEFER					-> "DEFER"
	| GO						-> "GO"
	| MAP						-> "MAP"
	| STRUCT 				-> "STRUCT"

	| CHAN					-> "CHAN"
	| ELSE					-> "CHAN"
	| GOTO					-> "GOTO"
	| PACKAGE				-> "PACKAGE"
	| SWITCH				-> "SWITCH"
	
	| CONST 				-> "CONST"
	| FALLTHROUGH		-> "FALLTHROUGH"
	| IF						-> "IF"
	| RANGE					-> "RANGE"
	| TYPE					-> "TYPE"

	| CONTINUE			-> "CONTINUE"
	| FOR 					-> "FOR"
	| IMPORT				-> "IMPORT"
	| RETURN 				-> "RETURN"
	| VAR           -> "VAR"

	| PRINT         -> "PRINT"
	| PRINTLN				-> "PRINTLN"
	| APPEND				-> "APPEND"
	| LEN						-> "LEN"
	| CAP						-> "CAP"

	| PLUS          -> "PLUS"
	| BAND					-> "BAND"
	| PASSIGN				-> "PASSIGN"
	| ANDASSIGN			-> "ANDASSIGN"
	| AND           -> "AND"
	| EQUAL         -> "EQUAL"
	| NEQUAL        -> "NEQUAL"
	| LPAREN        -> "LPAREN"
	| RPAREN        -> "RPAREN"
	
	| MINUS         -> "MINUS"
	| BOR						-> "BOR"
	| MASSIGN				-> "MASSIGN"
	| ORASSIGN			-> "ORASSIGN"
	| OR            -> "OR"
	| LESSER        -> "LESSER"
	| LEQ           -> "LEQ"
	| LSQUARE				-> "LSQUARE"
	| RSQUARE				-> "RSQAURE"

	| TIMES         -> "TIMES"
	| XOR						-> "XOR"
	| TASSIGN				-> "TASSIGN"
	| XORASSIGN			-> "XORASSIGN"
	| LEFTARROW			-> "LEFTARROW"
	| GREATER       -> "GREATER"
	| GEQ           -> "GEQ"
	| LBLOCK        -> "LBLOCK"
	| RBLOCK        -> "RBLOCK"
	
	| DIV           -> "DIV"
	| LSHIFT				-> "LSHIFT"
	| DASSIGN				-> "DASSIGN"
	| LSHASSIGN			-> "LSHASSIGN"
	| PLUSPLUS			-> "PLUSPLUS"
	| ASSIGN        -> "ASSIGN"
	| COLASSIGN			-> "COLASSIGN"
	| COMMA					-> "COMMA"
	| SEMI          -> "SEMICOLON"
	
	| MOD				    -> "MOD"
	| RSHIFT				-> "RSHIFT"
	| MODASSIGN			-> "MODASSIGN"
	| RSHASSIGN			-> "RSHASSIGN"
	| MINUSMINUS		-> "MINUSMINUS"
	| NOT           -> "NOT"
	| TRIPDOT				-> "TRIPDOT"
	| DOT						-> "DOT"
	| COLON         -> "COLON"

	| ANDXOR				-> "ANDXOR"
	| ANDXORASSIGN	-> "ANDXORASSIGN"
	| UMINUS 				-> "UMINUS"
	| UNDERSCORE		-> "UNDERSCORE"


	| INT           -> "INT"
	| FLOAT         -> "FLOAT"
	| BOOL          -> "BOOL"
	| RUNE 					-> "RUNE"
	| STRING        -> "STRING"
	
	| IDENT(s)      -> "IDENT(" ^ s ^ ")"
	| STRINGLIT(s)  -> "STRINGLIT(" ^ s ^ ")"
	| INTLIT(i)     -> "INTLIT(" ^ string_of_int i ^ ")"
	| RUNELIT(c)		-> "RUNELIT(" ^ String.make 1 c ^ ")"
	| FLOATLIT(f)   -> "FLOATLIT(" ^ string_of_float f ^ ")"
	| BOOLLIT(b)    -> "BOOLLIT(" ^ string_of_bool b ^ ")"
	| TRUE          -> "TRUE"
	| FALSE         -> "FALSE"
	
	| EOF 					-> "EOF"
	| NOP           -> ""

let dump_tokens lexfun buf =
	let rec collect acc =
		match (lexfun buf) with
		| EOF -> List.rev acc
		| t -> collect ((dump_token t)::acc)
	in String.concat "\n" (collect [])

