//~0
//~1
//~2
//~3
//~4
//~5
//~6
//~7
//~8
//~9

package main

func main() {
    // tests the init-statment (short var decl here)
    for i, a := 0, 0; i < 10; i++ {
        println(a)
        a += 1
    }

    for {
        break // otherwise it'd be infinite
    }
}
