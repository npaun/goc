package foo

func main() {
    if x := 5; false {
        var t int = 1
    } else if y := 6; y > x {
        var z = t // t not declared
    }
}
