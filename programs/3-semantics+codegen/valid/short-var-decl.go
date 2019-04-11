//~5
//~6
//~7
//~8
//~9

package main

func main() {
    a, b, c := 5, 6, 7

    println(a)
    println(b)
    println(c)

    // redeclaration of vars in the same scope
    a, c, d := 8, 9, 10
    println(a)
    println(c)
}
