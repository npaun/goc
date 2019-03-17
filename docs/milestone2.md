# Milestone 2

## Team Members

* Michael Sukkarieh
* Nicholas Paun
* Justin Tremblay

## Design Decisions

### Parser/Lexer Fixes

The first thing that had to be done for this milestone was to fix the parser/lexer to ensure that it passed all the tests that were given after the first milestone. The biggest problem had to do with builtin function calls and due to the complexity of the rules surrounding them, two short weeding functions were added to the parser to ensure that:

1. Calls to builtins have the right number of arguments. (see `weed_builtin_call` in `parser.mly`)
2. Builtins are **not** used as expression statements. (see `weed_exprstmt_funcall` in `parser.mly`)

Other small issues had to do with short variable declarations and various small things but those were fairly easy to fix.

### Symbol Table Generation

In order to generate the symbol table, we implemented a symbol table module (see `symtbl.ml`) that contains the symbol table and symbol types and various other utility functions to manipulate them. The file also contains the code for recursively traversing the AST, throwing errors, and pretty-printing the symbols.

#### Symbol Table

The symbol table is implemented in a very conventional way; it consists of a hash table of symbols, mapped to their names. It also holds references to its parent and children aswell as it's depth, the global scope being of depth 0.

#### Symbols

The symbol implementation is also very straight forward; it consts of a name, the kind of symbol (variable, typedef, function or constant), and its type.

### Type Checker

*have fun Nic!*

## Team Organization

* Michael
    * Symbol table implementation
    * Symbol table building
    * Symbol table printing
* Nicholas
    * Symbol table implementation
    * Type checking
* Justin
    * Symbol table implementation
    * Symbol table building
    * Parser/Lexer fixes from previous milestone
    * Weeding passes for builtin functions calls
    
## References

* [](https://github.com/ossamaAhmed/GoLite-compiler)
    * Ideas for parser/lexer fixes
