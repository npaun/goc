// in a function call (expr)(args...), the expr must resolve to a function type
package foo

func bar(a1 int, a2 float64) {

}

func main() {
    (bar)(5, 5.0) // this is correct, (bar) resolves to func type
    (5 + 5)(5, 5.0) // obviously doesn't resolve to func
}
