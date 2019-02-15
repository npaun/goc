%{
%}

%token HELLO EOF

%type <Golite.ast> main
%start main
%%

main:
| HELLO EOF		{ Hello }
