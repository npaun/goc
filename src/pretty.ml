open Lexer
open Parser
open Golite

(* TODO: finish string_of_stmt *)

let string_of_lst (lst: 'a list) (sep: string) (f: 'a -> string) =
    List.fold_right (fun x acc -> acc ^ (if acc = "" then "" else sep) ^ f x) lst ""

let rec string_of_ast ast = match ast with 
    | Program(pkg, toplvl) -> string_of_pkg pkg ^ string_of_toplvl toplvl
and string_of_pkg pkg = match pkg with 
    | Package(id) -> "package " ^ id ^ "\n"
and string_of_toplvl lst = string_of_lst lst "\n" string_of_topdecl
and string_of_topdecl decl = match decl.v with
    | Func(id, sigs, typ, body) -> "func " ^ id ^ "(" ^ (string_of_sigs sigs ", ") ^ ") " ^ string_of_typ typ ^ " " ^ string_of_block body 
    | Global(decl') -> string_of_decl decl'
and string_of_decl decl = match decl with
    | Var(id, typ, expr) -> "var " ^ id ^ " " ^ string_of_typ typ ^ (match expr with None -> "" | Some e -> " = " ^ string_of_expr e) 
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
    | Struct(mems)  -> "struct {\n" ^ (string_of_sigs mems "\n") ^ "\n}"
and string_of_sigs sigs sep = 
    let string_of_sig = function
        | (id, typ) -> id ^ " " ^ string_of_typ typ 
    in
    string_of_lst sigs sep string_of_sig
and string_of_block blck = 
    "{\n" ^ (string_of_lst blck "\n" string_of_stmt) ^ "\n}"
and string_of_stmt stmt = match stmt.v with
    | Decl(decl_lst)                    -> string_of_lst decl_lst "\n" string_of_decl
    | Expr(expr)                        -> string_of_expr expr
    | Block(blck)                       -> string_of_block blck
    | Assign(id_lst, expr_lst)          -> (string_of_lst id_lst ", " (fun x -> x)) ^ " = " ^ (string_of_lst expr_lst ", " string_of_expr)
    | OpAssign(id, op, expr)            -> ""
    | IncDec(id, op)                    -> id ^ (match op with `INC -> "++" | `DEC -> "--")
    | Print(b, expr_lst)                -> "PRINT: NotImplemented"
    | Return(expr_opt)                  -> "return " ^ string_of_expr_opt expr_opt
    | If(c_lst)                         -> "IF: NotImplemented"
    | Switch(stmt, expr_opt, c_lst)     -> "SWITCH: NotImplemented"
    | For(e1_opt, e2_opt, e3_opt, blck) -> "FOR: NotImplemented"
    | Break                             -> "break"
    | Continue                          -> "continue"
    | Empty                             -> ""
and string_of_expr expr = match expr.v with
    | Op1(op, e)      -> string_of_op1 op ^ string_of_expr e
    | Op2(op, e1, e2) -> string_of_expr e1 ^ " " ^ string_of_op2 op ^ " " ^ string_of_expr e2
    | Call(id, e_lst) -> id ^ "(" ^ (string_of_lst e_lst ", " string_of_expr) ^ ")"
    | Cast(typ, e)    -> string_of_typ typ ^ "(" ^ string_of_expr e ^ ")"
    | V(id)           -> id
    | L(lit)          -> (
        match lit with
        | Bool(b) -> string_of_bool b
        | Rune(r) -> String.make 1 r
        | Int(i)  -> string_of_int i
        | Float64(f) -> string_of_float f
        | String(s) -> s
    )
and string_of_expr_opt expr = match expr with
    | None -> ""
    | Some e -> string_of_expr e
and string_of_op1 op = match op with
    | `POS -> "+"
    | `NEG -> "-"
    | `NOT | `BNOT -> "!"
and string_of_op2 op = match op with
    | `EQ -> "=="
    | `NEQ -> "!="
    | `LT -> "<"
    | `LEQ -> "<="
    | `GT -> ">"
    | `GEQ -> ">="
    | `AND -> "&&"
    | `OR -> "||"
    | `ADD -> "+"
    | `SUB -> "-"
    | `MUL -> "*"
    | `DIV -> "/"
    | `MOD -> "%"
    | `BXOR -> "^"
    | `BOR -> "|"
    | `BAND -> "&"
    | `BANDNOT -> "&^"
    | `SL -> "<<"
    | `SR -> ">>"
    
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

