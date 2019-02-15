(* file lexer.mll *)
{
open Parser
open Printf
exception Eof
exception LexFailure of string

let line_num = ref 1

let keyword_table = Hashtbl.create 53;;
let _ = List.iter (fun (kwd, tok) -> Hashtbl.add keyword_table kwd tok)
[ "var"     , VAR;
  "string"  , STRING;
  "int"     , INT;
  "float"   , FLOAT;
  "boolean" , BOOL;
  "bool"    , BOOL;
  "if"      , IF;
  "else"    , ELSE;
  "print"   , PRINT;
  "true"    , TRUE;(*BOOLLIT(true);*)
  "false"   , FALSE(*BOOLLIT(false)*)
 ];;

let string_of_token = function
    | VAR           -> "VAR"
    | STRING        -> "STRING"
    | INT           -> "INT"
    | FLOAT         -> "FLOAT"
    | BOOL          -> "BOOL"
    | IF            -> "IF"
    | ELSE          -> "ELSE"
    | PRINT         -> "PRINT"
    | TRUE          -> "TRUE"
    | FALSE         -> "FALSE"
    | SEMICOLON     -> "SEMICOLON"
    | COLON         -> "COLON"
    | PLUS          -> "PLUS"
    | MINUS         -> "MINUS"
    | TIMES         -> "TIMES"
    | DIV           -> "DIV"
    | EQUAL         -> "EQUAL"
    | NEQUAL        -> "NEQUAL"
    | GEQ           -> "GEQ"
    | LEQ           -> "LEQ"
    | GREATER       -> "GREATER"
    | LESSER        -> "LESSER"
    | AND           -> "AND"
    | OR            -> "OR"
    | NOT           -> "NOT"
    | LPAREN        -> "LPAREN"
    | RPAREN        -> "RPAREN"
    | LBLOCK        -> "LBLOCK"
    | RBLOCK        -> "RBLOCK"
    | ASSIGN        -> "ASSIGN"
    | INTLIT(i)     -> "INTLIT(" ^ string_of_int i ^ ")"
    | FLOATLIT(f)   -> "FLOATLIT(" ^ string_of_float f ^ ")"
    | STRINGLIT(s)  -> "STRINGLIT(" ^ s ^ ")"
    | BOOLLIT(b)    -> "BOOLLIT(" ^ string_of_bool b ^ ")"
    | IDENT(s)      -> "IDENT(" ^ s ^ ")"
    | NOP           -> ""
    | EOF           -> "eof"
    
}

let eol = '\n' | "\r\n"

rule token = parse
    | [' ' '\t'] { token lexbuf }
    | "//"      { comment lexbuf }
    | eol       { line_num := !line_num + 1; token lexbuf }
    | ';'       { SEMICOLON }
    | ':'       { COLON }
    | '+'       { PLUS }
    | '-'       { MINUS }
    | '*'       { TIMES }
    | '/'       { DIV }
    | "=="      { EQUAL }
    | "!="      { NEQUAL }
    | ">="      { GEQ }
    | "<="      { LEQ }
    | '>'       { GREATER }
    | '<'       { LESSER }
    | "&&"      { AND }
    | "||"      { OR }
    | '!'       { NOT }
    | '('       { LPAREN }
    | ')'       { RPAREN }
    | '{'       { LBLOCK }
    | '}'       { RBLOCK }
    | '='       { ASSIGN }
    | ['1'-'9']['0'-'9']* | '0' as lxm                { INTLIT(int_of_string lxm) }
    | ['1'-'9']*['0'-'9']['.']['0'-'9']+ as lxm { FLOATLIT(float_of_string lxm) }
    | ('"'[^'"''\\']*('\\'_[^'"''\\']*)*'"')  as lxm { STRINGLIT(lxm) }
    | ['a'-'z' 'A'-'Z' '_']['a'-'z' 'A'-'Z' '_' '0'-'9']* as tok
     {
         try
           Hashtbl.find keyword_table tok
         with Not_found -> IDENT(tok)
     }
    | eof { (*EOF*) raise Eof }
    | _ as c { raise (LexFailure("SyntaxError: invalid character in identifier: " ^ Char.escaped c ^ " at line " ^ string_of_int !line_num)) }

and comment = parse
    | eol { line_num := !line_num + 1; token lexbuf }
    | _ { comment lexbuf }

