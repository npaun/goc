%{
open Parsing
open Lexing
%}

%token <string> IDENT
%token <string> STRINGLIT
%token <int> INTLIT
%token <float> FLOATLIT
%token <bool> BOOLLIT
%token BREAK DEFAULT FUNC
%token INTERFACE SELECT CASE
%token DEFER GO MAP STRUCT
%token CHAN ELSE GOTO PACKAGE SWITCH
%token CONST FALLTHROUGH IF RANGE TYPE
%token CONTINUE FOR IMPORT RETURN VAR
%token PRINT PRINTLN APPEND LEN CAP
%token LPAREN RPAREN LBLOCK RBLOCK LSQUARE RSQUARE
%token PLUS MINUS BOR XOR 
%token TIMES DIV BAND
%token LESSER GREATER LEQ GEQ EQUAL NEQUAL
%token AND OR ASSIGN BASSIGN



/* https://golang.org/ref/spec#Operators */
/* BAND -> bitwise AND (&), etc */
%right ASSIGN BASSIGN
%left OR
%left AND
%left LESSER GREATER LEQ GEQ EQUAL NEQUAL
%left PLUS MINUS BOR XOR
%left TIMES DIV BAND
%nonassoc LPAREN LBLOCK
%nonassoc RPAREN RBLOCK
%nonassoc LSQUARE RSQUARE

%start program
%type <int list> program
%%

/* had to put some grammer rules so menhir would compile */
program: 
    stmt { $1 };

stmt:
    IF LBLOCK RBLOCK { 1 }