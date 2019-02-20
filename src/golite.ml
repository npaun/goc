type identifier = string

(* Various classes of operators *)
type op_incdec = [`INC | `DEC]
type op1 = [`POS | `NEG | `NOT | `BNOT]
type op_arith = [`ADD | `SUB | `MUL | `DIV | `MOD | `BXOR | `BOR | `BAND | `BANDNOT | `SL | `SR]
type op_assign = [op_arith | `SET]
type op2 = [op_arith | `EQ | `NEQ | `LT | `LEQ | `GT | `GEQ | `AND | `OR]

(* Go types *)
type type_name = [`BOOL | `RUNE | `INT | `FLOAT64 | `STRING | `Type of identifier]

type gotype = [ type_name | `TypeLit of type_lit ]
and type_lit = 
	| Slice of gotype
	| Array of int * gotype
	| Struct of struct_member list
and struct_member =
	| Embed of type_name 
	| Member of signature
and signature = identifier * gotype

(* Program AST *)
type ast = Program of package * toplevel_declaration list
and package = Package of identifier
and declaration =
	| Var of identifier * gotype * expression option 
	| Type of identifier * gotype
and toplevel_declaration = 
	| Global of declaration
	| Func of identifier * signature list * block
and block = statement list
and statement = 
	| Decl of declaration
	| Expr of expression
	| Block of block
	| Assign of identifier list * expression list
	| OpAssign of identifier * op_assign * expression
	| IncDec of identifier * op_incdec
	| Print of bool * expression list
	| Return of expression option
	| If of case list
	| Switch of expression option * case list
	| For of expression option * expression option * expression option
	| Break
	| Continue
and case = 
	| Case of expression * block
	| Default of block
and expression = operand * gotype
and operand =
	| Op1 of op1 * expression
	| Op2 of op2 * expression * expression
	| Call of identifier * expression list
	| Cast of gotype * expression 
	| L of literal
	| V of identifier 
and literal =
	| Bool of bool
	| Rune of char
	| Int of int
	| Float64 of float
	| String of string

exception SyntaxError of string
