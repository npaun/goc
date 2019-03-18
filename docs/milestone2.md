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

The symbol table is implemented in a very conventional way; it consists of a hash table of symbols, mapped to their names. It also holds references to its parent and children aswell as it's depth, the global scope having a depth of 0. The depth is primarly used for pretty-printing the symbol table, as it controls how many tabs are printed.

#### Symbols

The symbol implementation is also very straight forward; it consts of a name, the kind of symbol (variable, typedef, function or constant), and its type. The type of the symbol is implemented as a list of types in order to support function signatures. Symbol entries for variables and types just have a single entry in this type list, while symbol entries for functions have a type list in the form of: [return type; arg1 type; arg2 type, etc]. This allows for easy pretty-printing of the function signature and make the job of the typechecker. Lastly, it should be noted that all of the fields in the symbol struct are mutable, which allows for the symbol's to be modified in later stages of the compiler (ex. typechecker when it performs type inference)

##### Global Symbol Entries
A set of symbol entries are added into the root symbol table at the start of symbol generation. These symbol entries include all of GoLite's primitive types (int, float64, bool, rune, string), true/false constants, as well as the built-in functions (append, len, and cap). The actual program is contained within a symbol table which is the child of this global symbol table.

#### Scoping Rules
For the most part, most of the scoping rules just involve adding/getting symbols from the same scope. However, there are some notable statements that require careful handling of symbol table scoping. Some of these rules are noted below.

##### Functions
Functions are toplevel declerations, and are composed of an identifier, signature list and a block. Firstly, we add an entry into the program's symbol table (the one under the "global" symbol table exaplined in the Global Symbol Entries section above) for the function's identifier. Next, we scope a new symbol table and add in all of the parameters, followed by adding all of the statements within the block. This ensures that the function identifier is visible from the program's symbol table but the parameters and contents of the block are not.
###### Invalid main/init check
According the GoLite spec, function(s) with the name "main" or "init" cannot have parameters or a return type. This is enforced in our compiler by doing a check to ensure that no signatures exist and that the function's type is `VOID before any symbol entries are added. If this check passes, we through an error stating that the special function must be void and have no parameters.
###### Multiple init/blank funcs
GoLite supports multiple definitions of blank functions as well as functions named "init". Since we use a hashtable to map the function's name to it's symbol, we prefix the name of the function with "$" and postfix it with a number. The postfixed number is the current count of unbounded functions (init/blank funcs are not bounded). This allows us to have an entry in the symbol table's hashtable for each of the unbounded function definitions. Lastly, we set the type list of these functions to [`AUTO] to indicate that it is not bounded (this is used in the pretty-printer and typechecker).

##### If and Switch Statements
Special care was taken to ensure that the if and switch statements scoped properly. The main difficulty here lies in the fact that each case can declare new variables, which can be used in following cases. To implement this, we first scope a new symbol table for the entire if/switch statement, let's call this *outer_scope*. Next, we iterate through each of the cases (if and switch statements use the same case ast node), and do the following: 1) add a symbol entry for the case's statement into *outer_scope* 2) scope a new symbol table for the case's block and go through the block 3) unscope the block's symbol table and continue to the next case. 
##### For Statements
##### Short Variable Redecleration

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
