%{
open Parsing
open Lexing
%}

/* literals  TODO change to fit Golite spec*/
%token <string> IDENT
%token <string> STRINGLIT
%token <int> INTLIT
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
%token DIV LSHIFT DASSIGN LSHASSIGN PLUSPLUS ASSIGN COLASSIGN COMMA SEMICOLON
%token MOD RSHIFT MODASSIGN RSHASSIGN MINUSMINUS NOT TRIPDOT DOT COLON
%token ANDXOR ANDXORASSIGN
%token UMINUS
%token UNDERSCORE /* blank identifier _ */

/* variable declaration */
%token INT FLOAT BOOL RUNE STRING 




/* https://golang.org/ref/spec#Operators */
/* BAND -> bitwise AND (&), etc */
%right ASSIGN BASSIGN
%left OR
%left AND
%left LESSER GREATER LEQ GEQ EQUAL NEQUAL
%left PLUS MINUS BOR XOR
%left TIMES DIV BAND
%nonassoc LPAREN LBLOCK LSQUARE
%nonassoc RPAREN RBLOCK RSQUARE

%start program
%type <int list> program
%%

/* had to put some grammer rules so menhir would compile */
program: 
    stmt { $1 };

stmt:
    IF LBLOCK RBLOCK { 1 }
