(* file lexer.mll *)
{
open Parser
open Printf

let line_num = ref 1
let insert_semi = ref false

let insert_semi_up () =
  insert_semi := true

let insert_semi_down () = 
  insert_semi := false

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
  "if"      , IF;
  "range"   , RANGE;
  "type"    , TYPE;
  "for"     , FOR;
  "import"  , IMPORT;
  "var"     , VAR;

  (* additional keywords *)
  "print"   , PRINT;
  "println" , PRINTLN;
  "append"  , APPEND;
  "len"     , LEN;
  "cap"     , CAP;
 ];;
    
}

let eol = '\n' | "\r\n"
let not_eol = [^ '\n' '\r']
let decimal_digit = ['0'-'9']
let hex_digit = ['0'-'9' 'A'-'F' 'a'-'f']

let char = ['a'-'z' 'A'-'Z' '0'-'9'
	'`' '~' '!' '@' '#' '$' '%' '^'  '&' '*' '(' ')' '-' '_' '=' '+'
	'[' ']' '{' '}' '|' ';' ':'  '\'' ',' '<' '.' '>' '/' '?' ' ']

let escaped_char = '\\' ['a' 'b' 'f' 'n' 'r' 't' 'v' '\\' ''']


rule lex = parse
    | [' ' '\t'] { lex lexbuf }
    | "//" not_eol*      { lex lexbuf }
    | "/*"               { block_comment false lexbuf }
    | eol                { line_num := !line_num + 1; Lexing.new_line lexbuf;
                            match !insert_semi with
                              | true -> 
                                  insert_semi_down();
                                  SEMI  
                              | false -> 
                                  lex lexbuf
                         }

    (* special keywords that produce a semicolon insertion *)
    | "break"       { insert_semi_up(); BREAK }
    | "continue"    { insert_semi_up(); CONTINUE }
    | "fallthrough" { insert_semi_up(); FALLTHROUGH}
    | "return"      { insert_semi_up(); RETURN }
    | "true"        { insert_semi_up(); TRUE } 
    | "false"       { insert_semi_up(); FALSE }

    | '+'       { insert_semi_down(); PLUS }
    | '&'       { insert_semi_down(); BAND }
    | "+="      { insert_semi_down(); PASSIGN }
    | "&="      { insert_semi_down(); ANDASSIGN }
    | "&&"      { insert_semi_down(); AND }
    | "=="      { insert_semi_down(); EQUAL }
    | "!="      { insert_semi_down(); NEQUAL }
    | '('       { insert_semi_down(); LPAREN }
    | ')'       { insert_semi_up(); RPAREN }

    | '-'       { insert_semi_down(); MINUS }
    | '|'       { insert_semi_down(); BOR }
    | "-="      { insert_semi_down(); MASSIGN }
    | "|="      { insert_semi_down(); ORASSIGN }
    | "||"      { insert_semi_down(); OR }
    | '<'       { insert_semi_down(); LESSER }
    | "<="      { insert_semi_down(); LEQ }
    | '['       { insert_semi_down(); LSQUARE }
    | ']'       { insert_semi_up(); RSQUARE }

    | '*'       { insert_semi_down(); TIMES }
    | '^'       { insert_semi_down(); XOR }
    | "*="      { insert_semi_down(); TASSIGN }
    | "^="      { insert_semi_down(); XORASSIGN }
    | "<-"      { insert_semi_down(); LEFTARROW }
    | '>'       { insert_semi_down(); GREATER }
    | ">="      { insert_semi_down(); GEQ }
    | '{'       { insert_semi_down(); LBLOCK }
    | '}'       { insert_semi_up(); RBLOCK }

    | '/'       { insert_semi_down(); DIV }
    | "<<"      { insert_semi_down(); LSHIFT }
    | "/="      { insert_semi_down(); DASSIGN }
    | "<<="     { insert_semi_down(); LSHASSIGN }
    | "++"      { insert_semi_up(); PLUSPLUS }
    | '='       { insert_semi_down(); ASSIGN }
    | ":="      { insert_semi_down(); COLASSIGN }
    | ','       { insert_semi_down(); COMMA }
    | ';'       { insert_semi_down(); SEMI }

    | '%'       { insert_semi_down(); MOD }
    | ">>"      { insert_semi_down(); RSHIFT }
    | "%="      { insert_semi_down(); MODASSIGN }
    | ">>="     { insert_semi_down(); RSHASSIGN }
    | "--"      { insert_semi_up(); MINUSMINUS }
    | '!'       { insert_semi_down(); NOT }
    | "..."     { insert_semi_down(); TRIPDOT }
    | "."       { insert_semi_down(); DOT }
    | ':'       { insert_semi_down(); COLON }

    | "&^"      { insert_semi_down(); ANDXOR }
    | "&^="     { insert_semi_down(); ANDXORASSIGN }

    | "_"       { insert_semi_down(); UNDERSCORE }

    | ['1'-'9']decimal_digit* as lxm                          { insert_semi_up(); INTLIT(int_of_string lxm) }
    | '0'['0'-'7']* as lxm                                    { insert_semi_up(); INTLIT(int_of_string ("0o" ^ lxm)) }
    | '0'['x' 'X']hex_digit hex_digit* as lxm                 { insert_semi_up(); INTLIT(int_of_string lxm) }
    | decimal_digit*'.'decimal_digit* as lxm                  { insert_semi_up(); FLOATLIT(float_of_string lxm) } 
    | ''' (char | escaped_char) '''                           { insert_semi_up(); RUNELIT (Lexing.lexeme lexbuf) }
    | '"' (char | escaped_char)* '"'                          { insert_semi_up(); STRINGLIT(Lexing.lexeme lexbuf) }    
    | '`' (char | '\\')* '`'                                  { insert_semi_up(); STRINGLIT(Lexing.lexeme lexbuf) }
    | ['a'-'z' 'A'-'Z' '_']['a'-'z' 'A'-'Z' '_' '0'-'9']* as tok
     {
         try
           Hashtbl.find keyword_table tok
         with Not_found -> ( insert_semi_up(); IDENT(tok) )
     }
    | eof { EOF }
    | _ as c { raise (Golite.LexFailure("SyntaxError: invalid character in identifier: " ^ Char.escaped c ^ " at line " ^ string_of_int !line_num)) }

and block_comment hit_eol = parse
    | eol { line_num := !line_num + 1; Lexing.new_line lexbuf; block_comment true lexbuf } 
    | "*/" { match !insert_semi, hit_eol with
              | true, true ->
                  insert_semi_down();
                  SEMI
              | _, _ ->
                  lex lexbuf }
    | _ { block_comment hit_eol lexbuf }
