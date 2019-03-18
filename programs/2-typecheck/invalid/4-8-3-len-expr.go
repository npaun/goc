// The argument of len must resolve to type array or slice
package foo

func getSlice() []int {
    var slic []int
    return slic
}

func main() {
    var arr [5]int
    var slice []int

    var x = len(arr) // correct
    var y = len(slice) // correct
    var z = len(getSlice) // correct
    var w = len((5 + 5) / 2) // incorrect
}
