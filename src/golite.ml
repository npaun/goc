open Sexplib.Conv

type identifier = string [@@deriving sexp]
type tagged_identifier = [`V of identifier] [@@deriving sexp]
type identifier' = [tagged_identifier | `Blank] [@@deriving sexp]

(* Various classes of operators *)
type op_incdec = [`INC | `DEC] [@@deriving sexp]
type op1 = [`POS | `NEG | `NOT | `BNOT] [@@deriving sexp]
type op_arith = [`ADD | `SUB | `MUL | `DIV | `MOD | `BXOR | `BOR | `BAND | `BANDNOT | `SL | `SR] [@@deriving sexp]
type op_assign = [op_arith | `SET] [@@deriving sexp]
type op2 = [op_arith | `EQ | `NEQ | `LT | `LEQ | `GT | `GEQ | `AND | `OR] [@@deriving sexp]

type fallthrough_mode = FALLTHROUGH | ENDBREAK [@@deriving sexp]

(* Go types *)
type type_name = [`BOOL | `RUNE | `INT | `FLOAT64 | `STRING | `AUTO | `VOID | `Type of identifier]
[@@deriving sexp]
type gotype = [ type_name | `TypeLit of type_lit ]
[@@deriving sexp]
and type_lit = 
	| Slice of gotype
	| Array of int * gotype
	| Struct of signature list
[@@deriving sexp]
and struct_member = (* delete???? *)
	| Embed of type_name 
	| Member of signature
[@@deriving sexp]
and signature = identifier * gotype 
[@@deriving sexp]

(* Add whatever metadata you want to attach to a statement or expression here *)
type 'a annotated = {
	v: 'a;
	_debug: string [@sexp_drop_if fun x -> x = "Hi!"];
	_start: (int * int) [@sexp_drop_if fun x -> true];
	_end: (int * int) [@sexp_drop_if fun x -> true];
	_derived: type_name option [@sexp_drop_if fun x -> x = None]
} [@@deriving sexp]

(* Expressions *)
type expression = operand annotated
[@@deriving sexp]
and operand = [
	| `Op1 of (op1 * expression)
	| `Op2 of (op2 * expression * expression)
	| `Call of (identifier * expression list)
	| `Cast of (gotype * expression)
	| `Selector of (expression * identifier)
	| `L of literal
    	| `Indexing of (expression * expression)
	|  tagged_identifier ]
[@@deriving sexp]
and literal =
	| Bool of bool
	| Rune of string
	| Int of int
	| Float64 of float
	| String of string
[@@deriving sexp]

type lvalue = expression (* No further inspection for now *)
[@@deriving sexp]
and ident'' = identifier' annotated
and lvalue' = [operand | identifier'] annotated
[@@deriving sexp]

(* Program AST *)
type ast = Program of package * toplevel_declaration annotated list [@@deriving sexp]
and package = Package of identifier [@@deriving sexp]
and declaration =
	| Var of lvalue' * gotype * expression option * bool
	| Type of identifier' * gotype
[@@deriving sexp]
and toplevel_declaration = 
	| Global of declaration
	| Func of identifier' * signature list * gotype * block
[@@deriving sexp]
and block = statement list
[@@deriving sexp]
and statement = statement_node annotated
[@@deriving sexp]
and statement_node = 
	| Decl of declaration list
	| Expr of expression
	| Block of block
	| Assign of (lvalue' * expression) list
	| OpAssign of lvalue * op_assign * expression
	| IncDec of expression * op_incdec
	| Print of bool * expression list
	| Return of expression option
	| If of case list
	| Switch of statement_node * expression option * fallable_case list
	| For of statement_node option * expression option * statement_node option * block
	| Break
	| Continue
	| Empty
[@@deriving sexp]
and fallable_case = case * fallthrough_mode
[@@deriving sexp]
and case = 
	| Case of statement_node * expression list * block
	| Default of block
[@@deriving sexp]


exception LexFailure of string
exception SyntaxError of string
    
    
