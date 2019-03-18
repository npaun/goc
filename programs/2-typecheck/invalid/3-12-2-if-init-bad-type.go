// The init-stmt of an if-statement case must be well-typed
package foo

func main() {
    if x1 := "foo" + 1; true {
        // Bad init
        var x = x1
    }
}
