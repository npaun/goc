// The first argument of append must resolve to a slice type
package foo

func main() {
    var slice, slice2 []int

    slice2 = append(true, 5)
}
