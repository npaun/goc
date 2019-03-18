// the return type of len is int, cannot be assigned to other types
package foo

func main() {
    var arr [5]int

    var x float64 = len(arr) // incorrect
}
