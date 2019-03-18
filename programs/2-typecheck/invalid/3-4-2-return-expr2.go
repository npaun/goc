// The type of the returned expression must match the function's specified return-type
package thing

func foo() int {
    return 5 + 8 // correct
}

func foo1() float64 {
    return 5.8 // correct
}

func foo2() float64 {
    return foo() // incorrect
}
