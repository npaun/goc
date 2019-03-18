package foo

type (
    num int
    float float64
)

func main() {
    type num bool // that's fine, shadows the global scope
    type num float // not fine
    var x num = num(float(6.0))
}
