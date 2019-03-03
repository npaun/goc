package thing

func main() {
    if true {
        foo()
    } else {
        bar()
    }

    if x := 5; x == 5 {
        foo()
    }

    if var x = 5; x == 5 {
        foo()
    }
}
