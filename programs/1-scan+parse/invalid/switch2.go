package foo

var (
    a, b bool
)

func test_switch_stmt_expr() {
    switch d,x := b,a; d {
        case a := b: foo() // statement inside a switch case
        case false: foo()
        default: bar()
    }
}
