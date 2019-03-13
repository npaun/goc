open Printf

let load_text () = 
	let cin = if Array.length Sys.argv > 2
			then open_in Sys.argv.(2)
			else stdin
	in Lexing.from_channel cin

let with_error_handling fn ok =
	try (
		fn ();
		if ok then printf "OK\n"
	) with
	| Golite.SyntaxError message
	| Golite.LexFailure message 
    | Symtbl.SymbolErr message ->  (
		fprintf stderr "Error: %s\n" message;
		exit 1
    )

let weed ast = Terminal.pass ast |> Lvalue.pass |> Switch.pass   
    
let parse lexbuf = Parser.main Lexer.lex lexbuf |> weed

let build_symtbl = let tbl = Symtbl.make_tbl in ()

let main () = 
	let lexbuf = load_text() in
		match Sys.argv.(1) with
		| "scan" -> with_error_handling (fun () -> Pretty.dump_tokens Lexer.lex lexbuf) true
		| "tokens" -> with_error_handling (fun () -> printf "%s\n" (Pretty.dump_tokens Lexer.lex lexbuf)) false
		| "parse" -> with_error_handling (fun () -> parse lexbuf) true 
		| "pretty" -> with_error_handling (fun () -> parse lexbuf |> Pretty.dump_ast |> printf "%s\n") false
		| "dumpast" -> with_error_handling (fun () -> parse lexbuf |> Dumpast.dump |> printf "%s\n") false
        | "symbol" -> with_error_handling (fun () -> build_symtbl) true
		| _ -> printf "Go away\n"

let _ = main ()


