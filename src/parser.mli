
(* The type of tokens. *)

type token = 
  | XORASSIGN
  | XOR
  | VAR
  | UNDERSCORE
  | UMINUS
  | TYPE
  | TRUE
  | TRIPDOT
  | TIMES
  | TASSIGN
  | SWITCH
  | STRUCT
  | STRINGLIT of (string)
  | STRING
  | SEMI
  | SELECT
  | RUNE
  | RSQUARE
  | RSHIFT
  | RSHASSIGN
  | RPAREN
  | RETURN
  | RBLOCK
  | RANGE
  | PRINTLN
  | PRINT
  | PLUSPLUS
  | PLUS
  | PASSIGN
  | PACKAGE
  | ORASSIGN
  | OR
  | NOT
  | NOP
  | NEQUAL
  | MODASSIGN
  | MOD
  | MINUSMINUS
  | MINUS
  | MASSIGN
  | MAP
  | LSQUARE
  | LSHIFT
  | LSHASSIGN
  | LPAREN
  | LESSER
  | LEQ
  | LEN
  | LEFTARROW
  | LBLOCK
  | INTLIT of (int)
  | INTERFACE
  | INT
  | IMPORT
  | IF
  | IDENT of (string)
  | GREATER
  | GOTO
  | GO
  | GEQ
  | FUNC
  | FOR
  | FLOATLIT of (float)
  | FLOAT
  | FALSE
  | FALLTHROUGH
  | EQUAL
  | EOF
  | ELSE
  | DOT
  | DIV
  | DEFER
  | DEFAULT
  | DASSIGN
  | CONTINUE
  | CONST
  | COMMA
  | COLON
  | COLASSIGN
  | CHAN
  | CASE
  | CAP
  | BREAK
  | BOR
  | BOOLLIT of (bool)
  | BOOL
  | BAND
  | ASSIGN
  | APPEND
  | ANDXORASSIGN
  | ANDXOR
  | ANDASSIGN
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Golite.ast)
