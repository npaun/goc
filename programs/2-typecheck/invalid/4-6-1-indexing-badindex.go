// an index must be of type int
package foo

func main() {
    var arr [5]int
    var arr2 []int

    var x = arr[1] // fine
    var z = arr2[4] // out of bounds but that doesn't matter here
    var y = arr["index"] // not fine
}
