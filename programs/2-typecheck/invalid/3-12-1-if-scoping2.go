package foo

func main() {
    if x := 5; false {
        var t int = y // y not declared yet
    } else if y := 6; y > x {
        var z = x
    }
}
