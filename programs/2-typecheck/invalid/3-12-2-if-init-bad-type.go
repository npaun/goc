package foo

func main() {
    if x1 := "foo" + 1; true {
        // Bad init
        var x = x1
    }
}
