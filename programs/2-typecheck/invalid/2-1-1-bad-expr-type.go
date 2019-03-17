package foo

func returnInt() int {
    return 42; // answer to the universe!
}

func returnFloat() float64 {
    return 42.0;
}

func main() {
    var x int = returnInt()
    var y int = returnFloat() // invalid
}
