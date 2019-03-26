package foo

type num int

func foo() []num {
    var a []num
    a = append(a, num(1))
    return a
}

func main() {
    type num int
    var y num
    foo()[0] = y
}
