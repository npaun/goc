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
let string  = ['a'-'z' 'A'-'Z' '0'-'9'
	'`' '~' '!' '@' '#' '$' '%' '^'  '&' '*' '(' ')' '-' '_' '=' '+'
	'[' ']' '{' '}' '|' ';' ':'  '\'' ',' '<' '.' '>' '/' '?' ' ']

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

    | ['1'-'9']decimal_digit* as lxm                                          { INTLIT(int_of_string lxm) }
    | '0'['0'-'7']* as lxm                                                    { INTLIT(int_of_string ("0o" ^ lxm)) }
    | '0'['x' 'X']['0'-'9' 'A'-'F' 'a'-'f']['0'-'9' 'A'-'F' 'a'-'f']* as lxm  { INTLIT(int_of_string lxm) }
    | decimal_digit*'.'decimal_digit* as lxm                                  { FLOATLIT(float_of_string lxm) } 
    | '"'                                                                     { STRINGLIT(lex_string (Buffer.create 32) lexbuf) }    
    | '''                                                                     { STRINGLIT(lex_string_lit (Buffer.create 32) lexbuf) }
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

and lex_string_lit b = parse
  | '''       {Buffer.contents b}
  | eof       { raise (LexFailure("Lexer - End of file in quoted string"))}
  | _ as c    {Buffer.add_char b c; lex_string_lit b lexbuf} 

and lex_string b = parse
	| '"'				{ Buffer.contents b }
	| '\\'				{ lex_escape b lexbuf }
	| string* as str		{ Buffer.add_string b str; lex_string b lexbuf }
	| eof 				{ raise (LexFailure "Lexer - End of file in quoted string") }
	| _ 				{ raise (LexFailure ("Lexer - Invalid character in quoted string")) }
  
and lex_escape b = parse
	| 'a'				{ Buffer.add_char b '\007'; lex_string b lexbuf }
	| 'b'				{ Buffer.add_char b '\008'; lex_string b lexbuf }
	| 'f'				{ Buffer.add_char b '\012'; lex_string b lexbuf }
	| '"'				{ Buffer.add_char b '"'; lex_string b lexbuf } 
	| 'n'				{ Buffer.add_char b '\n'; lex_string b lexbuf }
	| 'r'				{ Buffer.add_char b '\r'; lex_string b lexbuf }
	| 't'				{ Buffer.add_char b '\t'; lex_string b lexbuf }
	| '\\'				{ Buffer.add_char b '\\'; lex_string b lexbuf }
	| 'v'				{ Buffer.add_char b '\011'; lex_string b lexbuf }
	| eof				{ raise (LexFailure "Lexer - End of file in escape sequence") }
	| _				{ raise (LexFailure "Lexer - Invalid escape character") }

(*
(* TODO: make this work with block comments *)
and inject_semi_if_last = parse
    | [' ' '\t'] { inject_semi_if_last lexbuf }
    | "//"      { Buffer.add_string lexbuf ";//" }
    | eol { Buffer.add_string lexbuf ";\n" }
    | _ as c { Buffer.add_char lexbuf c }
*)
