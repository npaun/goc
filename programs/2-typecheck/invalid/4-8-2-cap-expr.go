// The argument of cap must resolve to type array or slice
package foo

func getSlice() []int {
    var slic []int
    return slic
}

func main() {
    var arr [5]int
    var slice []int

    var x = cap(arr) // correct
    var y = cap(slice) // correct
    var z = cap(getSlice) // correct
    var w = cap((5 + 5) / 2) // incorrect
}
