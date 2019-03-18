// return no expression is only legal when the function doesn't specify a return-type
package thing

func foo() {
    return // correct
}

func foo1() int {
    return // incorrect
}
