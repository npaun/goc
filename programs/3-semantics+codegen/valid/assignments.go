//~10
//~10
//~15
//~10
//~69

package main 

var global int = 10

func sideEffect() int {
    global = 69
    return 5
}

func addressableSlice() []float64 {
    var a []float64
    a = append(a, 42.0)
    return a
}

func main() {
    var a int = 5
    var b int = 5
    a += b
    println(a)

    var c, d int
    c, d = 10, 15
    println(c)
    println(d)

    println(global)
    _ = sideEffect()
    println(global)

    // not printed, but still a valid assignment
    addressableSlice()[0] = 42.1
}
