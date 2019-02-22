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
    
}
let eol = '\n' | "\r\n"
let decimal_digit = ['0'-'9']

(* TODO: check to make sure float rule does not generate a DOT token: *)
rule lex = parse
    | [' ' '\t'] { lex lexbuf }
    | "//"      { comment lexbuf }
    | "/*"      { block_comment lexbuf }
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

    | ['1'-'9']decimal_digit* as lxm                { INTLIT(int_of_string lxm) }
    | '0'['0'-'7']* as lxm                      { INTLIT(int_of_string ("0o" ^ lxm)) }
    | '0'['x' 'X']['0'-'9' 'A'-'F' 'a'-'f']['0'-'9' 'A'-'F' 'a'-'f']* as lxm { INTLIT(int_of_string lxm) }
    | decimal_digit*'.'decimal_digit* as lxm { FLOATLIT(float_of_string lxm) } 
    | ('"'[^'"''\\']*('\\'_[^'"''\\']*)*'"')  as lxm { STRINGLIT(lxm) }
    | ['a'-'z' 'A'-'Z' '_']['a'-'z' 'A'-'Z' '_' '0'-'9']* as tok
     {
         try
           Hashtbl.find keyword_table tok
         with Not_found -> IDENT(tok)
     }
    | eof { EOF }
    | _ as c { raise (LexFailure("SyntaxError: invalid character in identifier: " ^ Char.escaped c ^ " at line " ^ string_of_int !line_num)) }

and comment = parse
    | eol { line_num := !line_num + 1; lex lexbuf }
    | _ { comment lexbuf }

and block_comment = parse
    | eol { line_num := !line_num + 1; block_comment lexbuf }
    | "*/" { lex lexbuf }
    | _ { block_comment lexbuf }

(*
(* TODO: make this work with block comments *)
and inject_semi_if_last = parse
    | [' ' '\t'] { inject_semi_if_last lexbuf }
    | "//"      { Buffer.add_string lexbuf ";//" }
    | eol { Buffer.add_string lexbuf ";\n" }
    | _ as c { Buffer.add_char lexbuf c }
*)
