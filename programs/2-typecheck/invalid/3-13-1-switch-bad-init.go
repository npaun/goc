// switch-statement init is not well-typed
package foo

func main() {
    var x = 1;
    switch x1 := "foo" + 1; x {
    case 1: x = 2
    default: x = 2
    }
}
