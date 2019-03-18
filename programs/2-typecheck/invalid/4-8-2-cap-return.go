// the return type of cap is int, cannot be assigned to other types
package foo

func main() {
    var arr [5]int

    var x float64 = cap(arr) // incorrect
}
