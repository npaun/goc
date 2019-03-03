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
    
let throw_error_expected msg actual expected s = 
    raise (SyntaxError ("Parser - " ^ msg ^ "\n Unexpected " ^ actual ^ " at line " ^ string_of_int s.pos_lnum ^ ", char " ^ string_of_int (s.pos_cnum - s.pos_bol + 1) ^ "\n"
                        ^ " expected " ^ expected))
    
let try_map f s =
    try
        f ()
    with 
    | Invalid_argument(arg) -> throw_error "Mismatch between length of LHS and RHS, each lvalue must be matched by exactly one expression" s
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
    | toplevel EOF { raise (SyntaxError "Parser - Missing package declaration at top of file.") }

/******* DECLARATIONS *******/
package: PACKAGE IDENT SEMI {Package $2}
    | PACKAGE SEMI {throw_error "Parser - missing package name. Expected identifier." $startpos($2)}
    
toplevel: 
    | mapannot(toplevel_decl) SEMI toplevel {$1 @ $3} 
    | { [] }

toplevel_decl:
    | function_decl  {$1}
    | typed_var_decl {List.map (fun dcl -> Global dcl) $1}
    | type_decl	     {List.map (fun dcl -> Global dcl) $1} 
    (* this is kind of a "catch-all" solution, it will catch any parsing error that doesn't already have an error defined *)
    | error          {throw_error "invalid top level declaration" $startpos($1)} 

/*************** TYPES **************/

typ:
    | IDENT         {`Type($1)}
    | type_literal  {$1}
    | error         {throw_error "Unknown/invalid type" $startpos($1)}
    
type_literal:
    | array_literal     {`TypeLit($1)}
    | slice_literal     {`TypeLit($1)}
    | struct_literal    {`TypeLit($1)}

array_literal:
    | LSQUARE INTLIT RSQUARE IDENT {Array($2, `Type $4)}
    
slice_literal:
    | LSQUARE RSQUARE IDENT {Slice(`Type $3)}
    
struct_literal:
    | STRUCT LBLOCK struct_signatures RBLOCK {Struct($3)}
    
struct_signatures:
    | signature_ids SEMI struct_signatures {$1 @ $3}
    | {[]}
    
/****** FUNCTION DECLARATIONS *******/

function_decl:
    | FUNC identp signature block     {[Func($2, $3, `VOID, $4)]}
    | FUNC identp signature typ block {[Func($2, $3, $4, $5)]}
    | identp signature block | identp signature typ block {throw_error_expected "Ill-formed function declaration." "identifier" "func" $startpos($1)}

signature:
	| goargs(flatten(separated_list(COMMA,signature_ids))) {$1}

signature_ids: 
    | golist(IDENT) typ {List.map (fun id -> (id, $2)) $1}
    
/***** VARIABLE DECLARATIONS *****/

identp: 
    | IDENT 		{`V $1}
    | UNDERSCORE	{`Blank}

identpp: annot(identp) {$1:ident'' :> lvalue'}    
    
(* TODO: validate that id_list and expr_list have same length? *)    
short_var_decl:
	(* TODO: Emit the list of variable declarations *)
    | golist(lvaluep) COLASSIGN golist(expr) {try_map (fun () -> List.map2 (fun id expr -> Var(id, `AUTO, Some expr, true)) $1 $3) $startpos($1)} 

typed_var_decl:
    | VAR t_var_decl {$2}
    
t_var_decl:
    | golist(identpp) typ                      {List.map (fun id -> Var((id), $2, None, false)) $1}
    | golist(identpp) typ ASSIGN golist(expr)  {try_map (fun () -> List.map2 (fun id expr -> Var((id), $2, Some expr, false)) $1 $4) $startpos($1)}
	| golist(identpp) ASSIGN golist(expr)      {try_map (fun () -> List.map2 (fun id expr -> Var((id), `AUTO, Some expr, false)) $1 $3) $startpos($1)}
    | goargs(dist_var_decl)                    {$1}
dist_var_decl:
    | t_var_decl SEMI dist_var_decl {$1 @ $3}
    | { [] }

/***** TYPE DECLARATIONS *******/

type_decl:
    | TYPE identp typ {[Type($2, $3)]}
    | TYPE goargs(dist_type_decl) {$2}
    
dist_type_decl:
    | identp typ SEMI dist_type_decl {Type($1, $2)::$4} 
    | { [] }

/****** STATEMENTS *********/

/** TODO: Deal with empty statements **/
block: 
| LBLOCK statements RBLOCK {$2}
| LBLOCK statements EOF {throw_error "unterminated block" $startpos($3) }

statements:
	| annot(stmt) SEMI statements 	{$1::$3}
	| SEMI statements	{$2}
	| {[]}

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
	| error				{throw_error "not a statement" $startpos($1) }
simple_stmt:
	| assign_stmt		{$1} 
	| short_var_decl	{Decl $1}
	| op_assign_stmt	{$1}
	| incdec_stmt		{$1}
	| print_stmt		{$1}
    	| fun_call          	{Expr (annot $1 $startpos($1) $endpos($1))}

/**** ASSIGNMENT-RELATED STATEMENTS ******/
assign_stmt:
    | golist(lvaluep) ASSIGN golist(expr) {Assign(try_map (fun () -> List.map2 (fun lval exp -> (lval, exp)) $1 $3) $startpos($1))} 

lvaluep:
    | lvalue    	{$1:lvalue :> lvalue'}
    | UNDERSCORE	{annot `Blank $startpos($1) $endpos($1)}

op_assign_stmt:
    | lvalue assign_op expr {OpAssign($1,$2,$3)}
    | UNDERSCORE assign_op  { throw_error "You may not modify the blank variable" $startpos }
     
lvalue:
    | expr		{$1}

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
    | expr PLUSPLUS {IncDec($1, `INC)}
    | expr MINUSMINUS {IncDec($1, `DEC)}

/***** PRINT ******/
print_stmt:
    | PRINT opt_arguments {Print(false, $2)}
    | PRINTLN opt_arguments {Print(true, $2)}

opt_arguments:
| goargs(gooptlist(expr)) {$1}
| error	{throw_error "Arguments required" $startpos} 
/**** RETURN ****/
return_stmt:
    | RETURN {Return None}
    | RETURN expr {Return (Some $2)}
    | RETURN error {throw_error "Ill-formed return statement, can return at most one expression" $startpos($1)}

/**** IF STATEMENT *****/
if_stmt:
    | if_head			{If $1}

if_head:
    | IF if_cond block if_tail	{let (c1,c2) = $2 in (Case (c1,c2,$3))::$4}

if_cond:
    | simple_stmt SEMI expr		{($1, [$3])}
    | expr				{(Empty, [$1])}
    | error SEMI			{throw_error "Only a simple statement may be used in if initialization" $startpos($1)}
if_tail:
    | ELSE if_head  {$2}
    | ELSE block	{[Default $2]}
    | ELSE error	{throw_error "Only an if clause or a block may follow an else"  $startpos($2) }
    | {[]}

/**** SWITCH STATEMENT ****/
switch_stmt:
    | SWITCH switch_cond delimited(LBLOCK,switch_case*,RBLOCK) {let (c1,c2) = $2 in Switch(c1,c2,$3)}

switch_cond:
    | expr      		        {(Empty, Some $1)} (* Will be handled by the weeder, as it is going to be less work than fixing the parser *)
    | simple_stmt SEMI expr?    {($1,$3)}
    | error SEMI		{throw_error "Only a simple statement may be used in switch-initialization" $startpos}
    | {(Empty,None)}

switch_case:
    | CASE golist(expr) COLON switch_body {let (b,ftm) = $4 in ((Case(Empty, $2, b)), ftm)}
    | DEFAULT COLON statements {((Default($3)), ENDBREAK)}
    | CASE error | DEFAULT error {throw_error "Ill-formed switch case, expected expression" $startpos($1)}
switch_body:
    | statements FALLTHROUGH SEMI* {($1,FALLTHROUGH)}
    | statements 			       {($1,ENDBREAK)}

/**** FOR STATEMENT *****/
for_stmt:
    | FOR for_conds	block	{let (c1,c2,c3) = $2 in For(c1,c2,c3,$3)}
    | FOR for_conds error   {throw_error "Ill-formed for statement, block expected after condition" $endpos($2)}

for_conds:
    | expr? 		{(None,$1,None)}
    | simple_stmt? SEMI expr? SEMI simple_stmt? {($1,$3,$5)}
/****** EXPRESSIONS ********/

mandatory_arguments: goargs(golist(expr)) {$1}
arguments:
	| mandatory_arguments {$1}
	| LPAREN RPAREN		{[]}
	| LPAREN error			{throw_error "Invalid arguments" $startpos}

(* follows the go precedence system *)
expr: expr1 {$1}

expr1: 
    | expr1 OR expr2 {annot (`Op2(`OR, $1, $3)) $startpos($1) $endpos($3)}
    | expr1 OR error	{throw_error "RHS argument to operator invalid" $startpos($3)}
    | expr2		 {$1}

expr2:
    | expr2 AND expr3 	{annot (`Op2(`AND,$1,$3)) $startpos($1) $endpos($3)}
    | expr2 AND error	{throw_error "RHS argument to operator invalid" $startpos($3)}
    | expr3			{$1}

expr3:
    | expr3 op_rel expr4	{annot (`Op2($2,$1,$3)) $startpos($1) $endpos($3)}
    | expr3 op_rel error	{throw_error "RHS argument to operator invalid" $startpos($3)}
    | expr4			{$1}

op_rel:
    | EQUAL			{`EQ}
    | NEQUAL		{`NEQ}
    | LESSER		{`LT}
    | GREATER		{`GT}
    | LEQ			{`LEQ}
    | GEQ			{`GEQ} 

expr4:
    | expr4 op_add expr5	{annot (`Op2($2,$1,$3)) $startpos($1) $endpos($3)}
    | expr4 op_add error	{throw_error "RHS argument to operator invalid" $startpos($3)}
    | expr5			{$1}

op_add:
    | PLUS			{`ADD}
    | MINUS			{`SUB}
    | BOR			{`BOR}
    | XOR			{`BXOR} 

expr5:
    | expr5 op_mul expr_unary	{annot (`Op2($2,$1,$3)) $startpos($1) $endpos($3)}
    | expr5 op_mul error	{throw_error "RHS argument to operator invalid" $startpos($3)}
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
    | op_unary expr_sub		{annot (`Op1($1,$2)) $startpos($1) $endpos($2)}
    | expr_sub			{$1}
    | op_rel | op_mul |  AND | OR {throw_error "Insufficient arguments to binary operator" $startpos($1) }
op_unary:
    | PLUS			{`POS}
    | MINUS			{`NEG}
    | XOR			{`BNOT}
    | NOT			{`NOT}

expr_sub:
    | goargs(expr)		    {$1}
    | annot(expr_operand)	{$1}
    | LPAREN RPAREN				{throw_error "Empty sub-expression" $startpos($1) }
    | LPAREN error				{throw_error "Invalid expression" $startpos($1) }

expr_operand:
    | IDENT				{`V $1}
    | literal			{`L $1}
    | index             {$1}
    | fun_call			{$1}
    | annot(expr_operand) DOT IDENT	{`Selector($1,$3)}
    | annot(expr_operand) DOT error	{throw_error "Only an field name may be referred to by a selector" $startpos($3)}

index:
    | annot(expr_operand) LSQUARE expr RSQUARE {`Indexing($1, $3)}
    | annot(expr_operand) LSQUARE error	{throw_error "Invalid expression as index" $startpos($3)}
fun_call:
    | function_name arguments {`Call($1,$2)} 

function_name:
    | IDENT 	{$1}
    | APPEND	{"append"}
    | LEN		{"len"}
    | CAP		{"cap"}

literal:
    | STRINGLIT	{String $1}
    | INTLIT 	{Int $1}
    | BOOLLIT	{Bool $1}
    | FLOATLIT	{Float64 $1}
    | RUNELIT   {Rune $1}
