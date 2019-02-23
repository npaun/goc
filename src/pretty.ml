open Lexer
open Parser
open Golite


let rec string_of_ast ast = match ast with 
    | Program(pkg, toplvl) -> string_of_pkg ^ string_of_toplvl
and string_of_pkg pkg = match pkg with 
    | Package(id) -> "package " ^ id ^ "\n"
and string_of_toplvl = match lst with
    | h::t -> List.fold_right (fun x acc -> acc ^ string_of_decl x.v) lst ""
and string_of_decl decl = match decl with
    | Func(id, sigs, typ, body) -> "func " ^ id ^ "(" ^ (string_of_sigs sigs ", ") ^ ") " ^
                                string_of_typ typ ^ string_of_block body 
    | Global(decl') -> string_of_decl decl'
and string_of_decl decl = match decl with
    | Var(id, typ, expr) -> "var " ^ id ^ " " ^ string_of_typ typ ^ (match expr with | Some e -> " = " ^ string_of_expr e | None -> "")
    | Type(id, typ)      -> "type " ^ id ^ " " ^ string_of_typ typ
and string_of_typ typ = match typ with
    | `BOOL         -> "bool"
    | `RUNE         -> "char"
    | `INT          -> "int"
    | `FLOAT64      -> "float64"
    | `STRING       -> "string"
    | `Type(id)     -> id
    | `AUTO | `VOID -> ""
    | `TypeLit(t)   -> string_of_typlit t
and string_of_typlit typlit = match typlit with
    | Slice(typ)    -> "[]" ^ string_of_typ typ 
    | Array(i, typ) -> "[" ^ string_of_int i ^ "]" ^ string_of_typ typ
    | Struct(mems)  -> "struct {\n" ^ (string_of_sigs sigs "\n") ^ "}"
and string_of_sigs sigs sep = 
    let string_of_sig = function
        | (id, typ) -> id ^ " " ^ string_of_typ typ 
    in
    List.fold_right (fun s acc -> acc ^ (if acc = "" then "" else sep) ^ string_of_sig s) sigs ""    
and string_of_block blck = 
    List.fold_right (fun s acc -> acc ^ (if acc = "" then "" else "\n") ^ string_of_stmt s.v) blck ""
and string_of_stmt stmt = match stmt with
    | Decl(decl_lst)                    -> ""
    | Expr(expr)                        -> ""
    | Block(blck)                       -> ""
    | Assign(id_lst, expr_lst)          -> ""
    | OpAssign(id, op, expr)            -> ""
    | IncDec(id, op)                    -> ""
    | Print(b, expr_lst)                -> ""
    | Return(expr_opt)                  -> ""
    | If(c_lst)                         -> ""
    | Switch(stmt, expr_opt, c_lst)     -> ""
    | For(e1_opt, e2_opt, e3_opt, blck) -> ""
    | Break                             -> "break"
    | Continue                          -> "continue"
    | Empty                             -> ""


let dump_ast ast = string_of_ast ast 

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

