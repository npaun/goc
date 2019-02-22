(* file lexer.mll *)
{
open Parser
open Printf
exception Eof
exception LexFailure of string

let line_num = ref 1

let keyword_table = Hashtbl.create 53;;
let _ = List.iter (fun (kwd, tok) -> Hashtbl.add keyword_table kwd tok)
[ 
  (* Go keywords *)
  "default" , DEFAULT;
  "func"    , FUNC;
  "interface", INTERFACE;
  "select"  , SELECT;
  "case"    , CASE;
  "defer"   , DEFER;
  "go"      , DEFER;
  "map"     , MAP;
  "struct"  , STRUCT;
  "chan"    , CHAN;
  "else"    , ELSE;
  "goto"    , GOTO;
  "package" , PACKAGE;
  "switch"  , SWITCH;
  "const"   , CONST;
  "fallthrough", FALLTHROUGH;
  "if"      , IF;
  "range"   , RANGE;
  "type"    , TYPE;
  "continue", CONTINUE;
  "for"     , FOR;
  "import"  , IMPORT;
  "return"  , RETURN;
  "var"     , VAR;

  (* additional keywords *)
  "print"   , PRINT;
  "println" , PRINTLN;
  "append"  , APPEND;
  "len"     , LEN;
  "cap"     , CAP;

  (* prim types *)
  "int"     , INT;
  "float"   , FLOAT;
  "bool"    , BOOL;
  "rune"    , RUNE;
  "string"  , STRING;

  (* bool literals*)
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
    | SEMI     -> "SEMICOLON"
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

rule lex = parse
    | [' ' '\t'] { lex lexbuf }
    | "//"      { comment lexbuf }
    | eol       { line_num := !line_num + 1; lex lexbuf }

    | '+'       { PLUS }
    | '&'       { BAND }
    | "+="      { PASSIGN }
    | "&="      { ANDASSIGN }
    | "&&"      { AND }
    | "=="      { EQUAL }
    | "!="      { NEQUAL }
    | '('       { LPAREN }
    | ')'       { RPAREN }

    | '-'       { MINUS }
    | '|'       { BOR }
    | "-="      { MASSIGN }
    | "|="      { ORASSIGN }
    | "||"      { OR }
    | '<'       { LESSER }
    | "<="      { LEQ }
    | '['       { LSQUARE }
    | ']'       { RSQUARE }

    | '*'       { TIMES }
    | '^'       { XOR }
    | "*="      { TASSIGN }
    | "^="      { XORASSIGN }
    | "<-"      { LEFTARROW }
    | '>'       { GREATER }
    | ">="      { GEQ }
    | '{'       { LBLOCK }
    | '}'       { RBLOCK }

    | '/'       { DIV }
    | "<<"      { LSHIFT }
    | "/="      { DASSIGN }
    | "<<="     { LSHASSIGN }
    | "++"      { PLUSPLUS }
    | '='       { ASSIGN }
    | ":="      { COLASSIGN }
    | ','       { COMMA }
    | ';'       { SEMI }

    | '%'       { MOD }
    | ">>"      { RSHIFT }
    | "%="      { MODASSIGN }
    | ">>="     { RSHASSIGN }
    | "--"      { MINUSMINUS }
    | '!'       { NOT }
    | "..."     { TRIPDOT }
    | "."       { DOT }
    | ':'       { COLON }

    | "&^"      { ANDXOR }
    | "%^="     { ANDXORASSIGN }

    | "_"       { UNDERSCORE }

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
    | eol { line_num := !line_num + 1; lex lexbuf }
    | _ { comment lexbuf }

