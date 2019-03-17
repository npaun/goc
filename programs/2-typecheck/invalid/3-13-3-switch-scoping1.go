package foo

func main() {
    var x = 1
    switch x1 := x; x1 {
    case 1:
        x = 2
        var x2 = x
    default: x = 2
    }
    var y = x2 // not declared, only in switch
}
