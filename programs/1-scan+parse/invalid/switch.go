package foo

var (
    a, b bool
)

func test_switch_expr() {
    switch a {
        case true: foo()
        case false: foo()
        default: bar()
        default: foo() // this parses, will be handled by the weeder
    }
}

func test_switch_stmt_expr() {
    switch d := b; d {
        case true: foo()
        case false: foo()
        default: bar()
    }
}

func test_switch_stmt() {
    switch d := b; {
        case true: foo()
        case false: foo()
        default: bar()
    }
}
