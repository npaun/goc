package foo

func main() {
    var x = 1
    switch x1 := x; x1 {
    case "foo": // bad case type
        x = 2
        var x2 = x
    default:
        x = 2
        var y = x // not declared, only in previous case
    }
}

