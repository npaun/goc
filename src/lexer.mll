{
open Parser
}

rule lex = parse
| "hello\n"	{ HELLO } 
| eof		{ EOF }
| _ 		{ raise (Golite.SyntaxError "Byebye") }
