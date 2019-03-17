package foo

func main() {
    if x := 5; false {
        var t int = x // y not declared yet
    }
    var y = x // x only in if scope
}
