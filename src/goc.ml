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
	| Golite.SyntaxError message -> (
		fprintf stderr "Error: %s\n" message;
		exit 1
    )
    | Lexer.LexFailure message -> (
        fprintf stderr "Error: %s\n" message;
        exit 1
    )
    | _ -> (
        fprintf stderr "Error: unhandled error\n";
        exit 1
    )

let parse lexbuf = Parser.main Lexer.lex lexbuf

let main () = 
	let lexbuf = load_text() in
		match Sys.argv.(1) with
		| "scan" -> with_error_handling (fun () -> Pretty.dump_tokens Lexer.lex lexbuf) true
		| "tokens" -> with_error_handling (fun () -> printf "%s\n" (Pretty.dump_tokens Lexer.lex lexbuf)) false
		| "parse" -> with_error_handling (fun () -> parse lexbuf) true 
		| "pretty" -> with_error_handling (fun () -> parse lexbuf |> Pretty.dump_ast |> printf "%s\n") false
		| _ -> printf "Go away\n"

let _ = main ()
