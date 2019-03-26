package foo

type num int
type a struct {
    x num
}

func main() {
    type num int
    var z num
    var y a
    z = y.x
}
