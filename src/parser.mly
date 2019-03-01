%{
open Golite
open Lexing

let annot node startpos endpos =
	let pos_tuple pos = 
		(pos.pos_lnum, pos.pos_cnum - pos.pos_bol)
	in
	{ v = node; _start = pos_tuple startpos; _end = pos_tuple endpos; _debug = "Hi!"; _derived = None}  
    
let throw_error msg s = 
    raise (SyntaxError ("Parser - " ^ msg ^ ", at line " ^ string_of_int s.pos_lnum ^ ", char " ^ string_of_int (s.pos_cnum - s.pos_bol + 1)))
%}

(*****
STILL TO DO:
1. Implement types
2. Implement factored variable declaration syntax
3. Implement factored type declaration syntax
*****)

/* literals  TODO change to fit Golite spec*/
%token <string> IDENT
%token <string> STRINGLIT
%token <int> INTLIT
%token <string> RUNELIT
%token <float> FLOATLIT
%token <bool> BOOLLIT  
%token TRUE FALSE 

/* Go keywords, written in the order they are presented in the lang spec */
%token BREAK DEFAULT FUNC INTERFACE SELECT
%token CASE DEFER GO MAP STRUCT
%token CHAN ELSE GOTO PACKAGE SWITCH
%token CONST FALLTHROUGH IF RANGE TYPE
%token CONTINUE FOR IMPORT RETURN VAR

/* additional keywords */
%token PRINT PRINTLN APPEND LEN CAP

/* operators, written in the order they are presented in the lang spec */
%token PLUS BAND PASSIGN ANDASSIGN AND EQUAL NEQUAL LPAREN RPAREN
%token MINUS BOR MASSIGN ORASSIGN OR LESSER LEQ LSQUARE RSQUARE
%token TIMES XOR TASSIGN XORASSIGN LEFTARROW GREATER GEQ LBLOCK RBLOCK
%token DIV LSHIFT DASSIGN LSHASSIGN PLUSPLUS ASSIGN COLASSIGN COMMA SEMI
%token MOD RSHIFT MODASSIGN RSHASSIGN MINUSMINUS NOT TRIPDOT DOT COLON
%token ANDXOR ANDXORASSIGN
%token UNDERSCORE /* blank identifier _ */

%token EOF

/* variable declaration */
%token INT FLOAT BOOL RUNE STRING 

(*/* https://golang.org/ref/spec#Operators */
/* BAND -> bitwise AND (&), etc */
%right ASSIGN BASSIGN
%left OR
%left AND
%left LESSER GREATER LEQ GEQ EQUAL NEQUAL
%left PLUS MINUS BOR XOR
%left TIMES DIV BAND
%nonassoc LPAREN LBLOCK LSQUARE
%nonassoc RPAREN RBLOCK RSQUARE
*)

%start main
%type <Golite.ast> main
%%

main: package toplevel EOF {Program($1,$2)}

/******* DECLARATIONS *******/
package: PACKAGE IDENT SEMI {Package $2}

toplevel: 
    | toplevel_decl SEMI toplevel {(List.map (fun dcl -> annot dcl $startpos($1) $endpos($1)) $1) @ $3} 
    | { [] }

toplevel_decl:
    	| function_decl  	{$1}
    	| typed_var_decl 	{List.map (fun dcl -> Global dcl) $1}
	| type_decl		{List.map (fun dcl -> Global dcl) $1}
    	(* this is kind of a "catch-all" solution, it will catch any parsing error that doesn't already have an error defined *)
	| error          	{throw_error "invalid top level declaration" $startpos($1)} 

/*************** TYPES **************/

typ:
    | INT       {`INT}
    | FLOAT     {`FLOAT64}
    | BOOL      {`BOOL}
    | RUNE      {`RUNE}
    | STRING    {`STRING}
    | IDENT     {`Type($1)} (* user defined *)
    | type_literal {$1}
    | error     {throw_error "Unknown/invalid type" $startpos($1)}
    
type_literal:
    | array_literal {`TypeLit($1)}
    | slice_literal {`TypeLit($1)}
    | struct_literal {`TypeLit($1)}

array_literal:
    | LSQUARE INTLIT RSQUARE typ {Array($2, $4)}
    
slice_literal:
    | LSQUARE RSQUARE typ {Slice($3)}
    
struct_literal:
    | STRUCT LBLOCK struct_signatures RBLOCK {Struct($3)}
    
struct_signatures:
    | signature_ids SEMI struct_signatures {$1 @ $3}
    | {[]}
    
/****** FUNCTION DECLARATIONS *******/

function_decl:
    | FUNC IDENT signature block     {[Func($2, $3, `VOID, $4)]}
    | FUNC IDENT signature typ block {[Func($2, $3, $4, $5)]}

signature:
	| LPAREN flatten(separated_list(COMMA, signature_ids)) RPAREN {$2}

signature_ids: 
    | identifier_list typ {List.map (fun id -> (id, $2)) $1}
    
/***** VARIABLE DECLARATIONS *****/

(* TODO: validate that id_list and expr_list have same length? *)    
short_var_decl:
	(* TODO: Emit the list of variable declarations *)
	| identifier_list COLASSIGN expr_list {List.map2 (fun id expr -> Var(id, `AUTO, Some expr, true)) $1 $3}

typed_var_decl:
    | VAR t_var_decl {$2}
    
t_var_decl:
    | identifier_list typ                   {List.map (fun id -> Var(id, $2, None, false)) $1}
	| identifier_list typ ASSIGN expr_list  {List.map2 (fun id expr -> Var(id, $2, Some expr, false)) $1 $4}
	| identifier_list ASSIGN expr_list      {List.map2 (fun id expr -> Var(id, `AUTO, Some expr, false)) $1 $3}
    | LPAREN dist_var_decl RPAREN               {$2}
    
dist_var_decl:
    | t_var_decl SEMI dist_var_decl {$1 @ $3}
    | { [] }

/***** TYPE DECLARATIONS *******/

type_decl:
    | TYPE IDENT typ {[Type($2, $3)]}
    | TYPE LPAREN dist_type_decl RPAREN {$3}
    
dist_type_decl:
    | IDENT typ SEMI dist_type_decl {Type($1, $2)::$4} 
    | { [] }

/****** STATEMENTS *********/

/** TODO: Deal with empty statements **/
block: LBLOCK statements RBLOCK {$2}

statements:
	| stmt SEMI statements 	{(annot $1 $startpos($1) $endpos($1))::$3}
	| SEMI statements	{$2}
	| {[]}
    	| error { throw_error "invalid statement" $startpos($1) }


stmt:
    | typed_var_decl	{Decl $1}
	| block			    {Block $1}
	| simple_stmt		{$1}
	| return_stmt		{$1}
	| if_stmt		    {$1}
	| switch_stmt		{$1}
	| for_stmt		    {$1}
	| BREAK			    {Break}
	| CONTINUE		    {Continue}
simple_stmt:
	| assign_stmt		{$1} 
	| short_var_decl	{Decl $1}
	| op_assign_stmt	{$1}
	| incdec_stmt		{$1}
	| print_stmt		{$1}
    | expr              {Expr $1}

/**** ASSIGNMENT-RELATED STATEMENTS ******/
assign_stmt:
    | identifier_list ASSIGN expr_list {Assign($1,$3)}

identifier_list:
    | lst = separated_nonempty_list(COMMA, IDENT) { lst }

op_assign_stmt:
    | IDENT assign_op expr {OpAssign($1,$2,$3)}

assign_op: 
    | PASSIGN {`ADD} 
    | MASSIGN {`SUB} 
    | ANDASSIGN {`BAND}
    | ORASSIGN {`BOR}
    | TASSIGN {`MUL}
    | XORASSIGN {`BXOR}
    | DASSIGN {`DIV}
    | LSHASSIGN {`SL}
    | MODASSIGN {`MOD}
    | RSHASSIGN {`SR}
    | ANDXORASSIGN {`BANDNOT}

incdec_stmt:
    | IDENT PLUSPLUS {IncDec($1,`INC)}
    | IDENT MINUSMINUS {IncDec($1,`DEC)}

/***** PRINT ******/
print_stmt:
    | PRINT mandatory_arguments {Print(false, $2)}
    | PRINTLN mandatory_arguments {Print(true, $2)}

/**** RETURN ****/
return_stmt:
    | RETURN {Return None}
    | RETURN expr {Return (Some $2)}

/**** IF STATEMENT *****/
if_stmt:
| if_head			{If  $1}

if_head:
| IF if_cond block if_tail	{let (c1,c2) = $2 in (Case (c1,c2,$3))::$4}

if_cond:
| simple_stmt SEMI expr		{($1, [$3])}
| expr				{(Empty, [$1])}

if_tail:
| ELSE if_head  {$2}
| ELSE block	{[Default $2]}
| {[]}

/**** SWITCH STATEMENT ****/
switch_stmt:
| SWITCH switch_cond delimited(LBLOCK,switch_case*,RBLOCK) {let (c1,c2) = $2 in Switch(c1,c2,$3)}

switch_cond:
| expr      		        {(Empty, Some $1)} (* Will be handled by the weeder, as it is going to be less work than fixing the parser *)
| simple_stmt SEMI expr?    {($1,$3)}
| {(Empty,None)}

switch_case:
| CASE expr_list COLON switch_body {let (b,ftm) = $4 in ((Case(Empty, $2, b)), ftm)}
| DEFAULT COLON statements {((Default($3)), ENDBREAK)}

switch_body:
| statements FALLTHROUGH SEMI* {($1,FALLTHROUGH)}
| statements 			       {($1,ENDBREAK)}

/**** FOR STATEMENT *****/
for_stmt:
| FOR for_conds	block	{let (c1,c2,c3) = $2 in For(c1,c2,c3,$3)}

for_conds:
| expr? 		{(None,$1,None)}
| simple_stmt? SEMI expr? SEMI simple_stmt? {($1,$3,$5)}

/****** EXPRESSIONS ********/

mandatory_arguments: delimited(LPAREN,expr_list,RPAREN) {$1}
arguments:
	| mandatory_arguments {$1}
	| LPAREN RPAREN		{[]}
expr_list: separated_nonempty_list(COMMA,expr) {$1}

(* follows the go precedence system *)
expr: expr1 {$1}

expr1: 
| expr1 OR expr2 {annot (Op2(`OR, $1, $3)) $startpos($1) $endpos($3)}
| expr2		 {$1}

expr2:
| expr2 AND expr3 	{annot (Op2(`AND,$1,$3)) $startpos($1) $endpos($3)}
| expr3			{$1}

expr3:
| expr3 op_rel expr4	{annot (Op2($2,$1,$3)) $startpos($1) $endpos($3)}
| expr4			{$1}

op_rel:
| EQUAL			{`EQ}
| NEQUAL		{`NEQ}
| LESSER		{`LT}
| GREATER		{`GT}
| LEQ			{`LEQ}
| GEQ			{`GEQ} 

expr4:
| expr4 op_add expr5	{annot (Op2($2,$1,$3)) $startpos($1) $endpos($3)}
| expr5			{$1}

op_add:
| PLUS			{`ADD}
| MINUS			{`SUB}
| BOR			{`BOR}
| XOR			{`BXOR} 

expr5:
| expr5 op_mul expr_unary	{annot (Op2($2,$1,$3)) $startpos($1) $endpos($3)}
| expr_unary			{$1}

op_mul:
| TIMES			{`MUL}
| DIV			{`DIV}
| MOD			{`MOD}
| LSHIFT		{`SL}
| RSHIFT		{`SR}
| BAND			{`BAND}
| ANDXOR		{`BANDNOT} 

expr_unary:
| op_unary expr_sub		{annot (Op1($1,$2)) $startpos($1) $endpos($2)}
| expr_sub			{$1}

op_unary:
| PLUS			{`POS}
| MINUS			{`NEG}
| XOR			{`BNOT}
| NOT			{`NOT}

expr_sub:
| LPAREN expr RPAREN		{$2}
| expr_operand			{annot $1 $startpos($1) $endpos($1)}

expr_operand:
| IDENT				{V $1}
| literal			{L $1}
| fun_call			{$1}
| expr_operand DOT IDENT	{Selector((annot $1 $startpos($1) $endpos($1)),$3)}

fun_call:
| function_name  arguments		{Call($1,$2)} 

function_name:
| IDENT 				{$1}
| APPEND				{"append"}
| LEN					{"len"}
| CAP					{"cap"}

literal:
| STRINGLIT	{String $1}
| INTLIT 	{Int $1}
| BOOLLIT	{Bool $1}
| TRUE      {Bool true}
| FALSE     {Bool false}
| FLOATLIT	{Float64 $1}
| RUNELIT   {Rune $1}
