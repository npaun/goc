package definedTypes

// In order for defined types to be equal, they must point to the same type specification

type (
    num int
    natural int
)

func main() {
    var x num = num(5)
    var y num = num(10)
    var z natural = num(7)

    x += y // Perfectly fine, same type
    x = z // Should fail, even though num and natural have the same underlying types, the defined types aren't the same
    // see https://golang.org/ref/spec#Type_identity
}
