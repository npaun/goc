package foo

func main() {
    if x1 := 1; x1 {
        // Bad condition, x1 is not bool
        var x = x1
    }
}
