type identifier = string

(* Various classes of operators *)
type op_incdec = [`INC | `DEC]
type op1 = [`POS | `NEG | `NOT | `BNOT]
type op_arith = [`ADD | `SUB | `MUL | `DIV | `MOD | `BXOR | `BOR | `BAND | `BANDNOT | `SL | `SR]
type op_assign = [op_arith | `SET]
type op2 = [op_arith | `EQ | `NEQ | `LT | `LEQ | `GT | `GEQ | `AND | `OR]

type fallthrough_mode = FALLTHROUGH | ENDBREAK

(* Go types *)
type type_name = [`BOOL | `RUNE | `INT | `FLOAT64 | `STRING | `AUTO | `VOID | `Type of identifier]
type gotype = [ type_name | `TypeLit of type_lit ]
and type_lit = 
	| Slice of gotype
	| Array of int * gotype
	| Struct of signature list
and struct_member = (* delete???? *)
	| Embed of type_name 
	| Member of signature
and signature = identifier * gotype 

(* Add whatever metadata you want to attach to a statement or expression here *)
type 'a annotated = {
	v: 'a;
	_debug: string;
	_start: int * int;
	_end: int * int;
	_derived: type_name option
}

(* Program AST *)
type ast = Program of package * toplevel_declaration annotated list
and package = Package of identifier
and declaration =
	| Var of identifier * gotype * expression option 
	| Type of identifier * gotype
and toplevel_declaration = 
	| Global of declaration
	| Func of identifier * signature list * gotype * block
and block = statement list
and statement = statement_node annotated
and statement_node = 
	| Decl of declaration list
	| Expr of expression
	| Block of block
	| Assign of identifier list * expression list
	| OpAssign of identifier * op_assign * expression
	| IncDec of identifier * op_incdec
	| Print of bool * expression list
	| Return of expression option
	| If of case list
	| Switch of statement_node * expression option * fallable_case list
	| For of expression option * expression option * expression option * block
	| Break
	| Continue
	| Empty
and fallable_case = case * fallthrough_mode
and case = 
	| Case of statement_node * expression list * block
	| Default of block
and expression = operand annotated
and operand =
	| Op1 of (op1 * expression)
	| Op2 of (op2 * expression * expression)
	| Call of (identifier * expression list)
	| Cast of (gotype * expression)
	| L of literal
	| V of identifier
and literal =
	| Bool of bool
	| Rune of string
	| Int of int
	| Float64 of float
	| String of string

exception SyntaxError of string
