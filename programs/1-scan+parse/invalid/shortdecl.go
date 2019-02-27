package foo

type (
    num int
    bar struct {
        a num
    }
)

func foofoo() {
    a := 1337
    if (a == 1337) {
        print(a)
    }
}

// short variable declarations are not allowed in the top level, only in the body of a function
shortvar := 420 + 0.420
