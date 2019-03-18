// The type of the returned expression must match the function's specified return-type
package thing

func foo() int {
    return 5 + 8 // correct
}

func foo1() int {
    return 5.8 // incorrect
}
