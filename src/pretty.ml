open Lexer
open Parser
open Golite
open Sexplib

(* TODO: finish string_of_stmt *)

let crt_stmt stmt_node = 
	{v = stmt_node;_debug="";_start=(-1,-1);_end=(-1,-1);_derived=None}

let crt_tab d b =
	if b then (String.make d '\t') else ""

let string_of_lst (lst: 'a list) (sep: string) (f: 'a -> string) =
	String.concat sep (List.map f lst)

let rec split_var_decl_list id_acc expr_acc decl_lst = match decl_lst with
		| h::t -> (
			let Var(id,typ, expr_opt, isshort) = h in
			split_var_decl_list (id::id_acc) (expr_opt::expr_acc) t 
		)
		| [] -> (id_acc, expr_acc)
let rec string_of_ast ast = match ast with 
    | Program(pkg, toplvl) -> string_of_pkg pkg ^ string_of_toplvl toplvl
and string_of_pkg pkg = match pkg with 
    | Package(id) -> "package " ^ id ^ "\n"
and string_of_toplvl lst = string_of_lst lst "\n" string_of_topdecl
and string_of_topdecl decl = match decl.v with
    | Func(id, sigs, typ, body) -> "func " ^ id ^ "(" ^ (string_of_sigs sigs ", ") ^ ") " ^ string_of_typ typ ^ " " ^ string_of_block 0 body 
    | Global(decl') -> string_of_decl_list 0 [decl']
and string_of_decl_list d decl_list = match decl_list with
		| h::t -> (match h with
							| Var(id, typ, expr, is_short) -> (
								let (id_lst, expr_lst) = split_var_decl_list [] [] decl_list in
								if is_short then (string_of_lst id_lst ", " (fun x -> x)) ^ " := " ^ (string_of_lst expr_lst ", " string_of_expr_opt)
								else "var " ^ (string_of_lst id_lst ", " (fun x -> x)) ^ " " ^ (string_of_typ typ) ^ (match expr with None -> "" | Some e -> " = " ^ (string_of_lst expr_lst ", " string_of_expr_opt))
							)
							| Type(id, typ) -> string_of_lst decl_list ("\n" ^ (crt_tab d true)) string_of_type_decl
							)
		| _ -> ""
and string_of_type_decl decl = 
		let Type(id,typ) = decl in 
		"type " ^ id ^ " " ^ string_of_typ typ
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
and string_of_block d blck = 
		"{\n" ^ (string_of_lst blck "\n" (string_of_stmt (d+1) true)) ^ "\n" ^ (crt_tab d true) ^ "}"
and string_of_switch_case d (c,fmt) = match c with
		| Case(_, expr_lst, blck) ->  (String.make d '\t') ^ "case " ^ (string_of_lst expr_lst ", " string_of_expr) ^ ":\n" ^ (string_of_lst blck "\n" (string_of_stmt (d+1) true))
		| Default(blck) -> (String.make d '\t') ^ "default:\n" ^ (string_of_lst blck "\n" (string_of_stmt (d+1) true))
and string_of_if_case d case = match case with
		| Case(stmt, expr_lst, blck) -> "if " ^ (string_of_stmt d false (crt_stmt stmt) ^ "; ") ^ (string_of_lst expr_lst ", " string_of_expr) ^ " " ^ (string_of_block d blck)
		| Default(blck) 						 -> string_of_block d blck
and string_of_stmt d tb stmt = match stmt.v with
		| Decl(decl_lst)                    -> (crt_tab d tb) ^ (string_of_decl_list d decl_lst)
		| Expr(expr)                        -> (crt_tab d tb) ^ string_of_expr expr
		| Block(blck)                       -> string_of_block (d+1) blck
		| Assign(id_lst, expr_lst)          -> (crt_tab d tb) ^ (string_of_lst id_lst ", " (fun x -> x)) ^ " = " ^ (string_of_lst expr_lst ", " string_of_expr)
		| OpAssign(id, op, expr)            -> (crt_tab d tb) ^ id ^ (string_of_op_assign op) ^ (string_of_expr expr) ^ "\n"
		| IncDec(id, op)                    -> (crt_tab d tb) ^ id ^ (match op with `INC -> "++" | `DEC -> "--")
		| Print(b, expr_lst)                -> (crt_tab d tb) ^ (if b then "println(" else "print(") ^ (string_of_lst expr_lst ", " string_of_expr) ^ ")\n"
		| Return(expr_opt)                  -> (crt_tab d tb) ^ "return " ^ string_of_expr_opt expr_opt
		| If(c_lst)                         -> (crt_tab d tb) ^ string_of_lst c_lst " else " (string_of_if_case d) 
		| Switch(stm, expr_opt, c_lst)      -> (crt_tab d tb) ^ "switch " ^ (string_of_stmt d false (crt_stmt stm) ^ "; ") ^ (string_of_expr_opt expr_opt) ^ " {\n" ^ (string_of_lst c_lst "\n" (string_of_switch_case (d+1))) ^ "\n" ^ (crt_tab d tb) ^ "}" 
		| For(s1_opt, e2_opt, s3_opt, blck) -> (crt_tab d tb) ^ "for " ^ (
			match s1_opt, e2_opt, s3_opt, blck with
				| None, None, None, _ -> string_of_block d blck
				| None, Some e, None, _ -> (string_of_expr e) ^ (string_of_block d blck)
				| _, _, _, _ ->  (string_of_stmt_opt s1_opt) ^ " ; " ^ (string_of_expr_opt e2_opt) ^ " ; " ^ (string_of_stmt_opt s3_opt) ^ " " ^ (string_of_block d blck)
		)
		| Break                             -> "break"
		| Continue                          -> "continue"
		| Empty                             -> ""
and string_of_stmt_opt stmt = match stmt with 
		| None -> ""
		| Some s -> string_of_stmt 0 false (crt_stmt s)
and string_of_expr expr = match expr.v with
    | Op1(op, e)      -> string_of_op1 op ^ string_of_expr e
    | Op2(op, e1, e2) -> string_of_expr e1 ^ " " ^ string_of_op2 op ^ " " ^ string_of_expr e2
    | Call(id, e_lst) -> id ^ "(" ^ (string_of_lst e_lst ", " string_of_expr) ^ ")"
    | Cast(typ, e)    -> string_of_typ typ ^ "(" ^ string_of_expr e ^ ")"
    | V(id)           -> id
    | L(lit)          -> (
        match lit with
        | Bool(b) -> string_of_bool b
        | Rune(r) -> r
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
	and string_of_op_arith op = match op with
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
	and string_of_op_assign op = match op with
		| `SET -> "="
		| `ADD -> "+="
		| `SUB -> "-="
		| `MUL -> "*="
		| `DIV -> "/="
		| `MOD -> "%="
		| `BXOR -> "^="
		| `BOR -> "|="
		| `BAND -> "&="
		| `BANDNOT -> "&^="
		| `SL -> "<<="
		| `SR -> ">>="
    
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
	| UNDERSCORE		-> "UNDERSCORE"


	| INT           -> "INT"
	| FLOAT         -> "FLOAT"
	| BOOL          -> "BOOL"
	| RUNE 					-> "RUNE"
	| STRING        -> "STRING"
	
	| IDENT(s)      -> "IDENT(" ^ s ^ ")"
	| STRINGLIT(s)  -> "STRINGLIT(" ^ s ^ ")"
	| INTLIT(i)     -> "INTLIT(" ^ string_of_int i ^ ")"
	| RUNELIT(c)		-> "RUNELIT(" ^ c ^ ")"
	| FLOATLIT(f)   -> "FLOATLIT(" ^ string_of_float f ^ ")"
	| BOOLLIT(b)    -> "BOOLLIT(" ^ string_of_bool b ^ ")"
	| TRUE          -> "TRUE"
	| FALSE         -> "FALSE"
	
	| EOF 					-> "EOF"

let dump_tokens lexfun buf =
	let rec collect acc =
		match (lexfun buf) with
		| EOF -> List.rev acc
		| t -> collect ((dump_token t)::acc)
	in String.concat "\n" (collect [])

(* Do not ask why this is here - it won't build if it's in goc.ml for no fucking reason *)
let raw_ast ast =
	Golite.sexp_of_ast ast |> Sexp.to_string_hum
