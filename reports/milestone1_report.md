# Milestone 1

## Team Members

* Michael Sukkarieh
* Nicholas Paun
* Justin Tremblay

## Design Decisions

### Tools

* Language used: Ocaml
* Scanner generator: Ocamllex
* Parser generator: Menhir
* Other: Opam (package manager for Ocaml), ocamlbuild (build system)

*TODO*: explain choices

### Scanner
The scanner was generated using Ocamllex. Each significant word in the GoLite language was represented with it's own regular expression (regex) which it would match and return it's corresponding token. The majority of these regex expressions are trivial, but a brief description of some notably interesting regex expressions/scanner features are provided below. These include: **line numbers, semicolon insertion, block comments, and int literal types**.
#### Line Numbers
Line numbers are implemented using a global int ref which is incremented whenever a newline character is encountered. This ref is then used to print useful error methods whenever a syntax error is encountered.
#### Semicolon insertion
As mentioned in the GoLite spec, only the first semicolon insertion rule mentioned in the original Go spec will be implemented. Our compiler implemented this feature using a boolean flag (insert_semi, implemented as a int ref) which records if a semicolon should be inserted. This flag is set to 1 after we encounter a token which invokes semicolon insertion (ex. an identifier), and is set to 0 in all other cases. Once an EOL character is given, we check if this flag is 1 and return a SEMI token if it is. Special care had to be taken to ensure this worked with block comments, this is explained in the block comment section below.
#### Block Comments
Ocamllex allows us to implement multiple parse methods, and we take advantage of that to implement block comments in our scanner. Effectively, this is similar to having different "states" within our scanner, allowing the scanner to behave differently on the given input based on its "state". A separate *block_comment* parse method is called when the scanner encounters "/\*". In this new parse method, we ignore all input except for EOL and "\*/". If an EOL is encountered, we increment the current line number and we recursively call the *block_comment* method - making sure to pass in true which signals that an EOL has been encountered. This is important since a semicolon must inserted at the end of the block comment if the comment spanned more than one line. Lastly, if "\*/" is encountered the block comment is complete; we return a SEMI token if an EOL was encountered and we return to the original parse method.
#### Int Literal Types
GoLite supports integers represented in decimal, octal, and hexadecimal units. We chose to represent an integer with a single token (INTLIT), and convert all encountered integers into decimal units when the token is generated. This is done automatically by Ocaml's *int_of_string* method. 

### Parser

TODO: Things that we need to weed: (invalid break/continue stmts, expression in short_var_decl?)

### AST

*TODO*: explain types used and `'a annotated` and how to use

### Pretty-Printer

*TODO*: explain recursive traversal of AST

## Team Organization

* Michael
    * Scanner
    * Token printing
    * Pretty-Printer
* Nicholas
    * Parser
    * AST
    * Core program
* Justin
    * Parser
    * AST
    * Pretty-Printer
