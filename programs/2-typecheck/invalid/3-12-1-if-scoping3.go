package foo

func main() {
    if x := 5; false {
        var t int = x // y not declared yet
    }
    var y = t // t only in if scope
}
