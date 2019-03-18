package foo

func main() {
    var x = 1
    switch x1 := x; x1 {
    case 1: x = 2
    default: x = 2
    }
    var y = x1 // not declared, only in switch
}
