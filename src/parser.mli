
(* The type of tokens. *)

type token = 
  | XOR
  | VAR
  | TYPE
  | TIMES
  | SWITCH
  | STRUCT
  | STRINGLIT of (string)
  | SELECT
  | RSQUARE
  | RPAREN
  | RETURN
  | RBLOCK
  | RANGE
  | PRINTLN
  | PRINT
  | PLUS
  | PACKAGE
  | OR
  | NEQUAL
  | MINUS
  | MAP
  | LSQUARE
  | LPAREN
  | LESSER
  | LEQ
  | LEN
  | LBLOCK
  | INTLIT of (int)
  | INTERFACE
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
  | FALLTHROUGH
  | EQUAL
  | ELSE
  | DIV
  | DEFER
  | DEFAULT
  | CONTINUE
  | CONST
  | CHAN
  | CASE
  | CAP
  | BREAK
  | BOR
  | BOOLLIT of (bool)
  | BASSIGN
  | BAND
  | ASSIGN
  | APPEND
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val program: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (int list)
