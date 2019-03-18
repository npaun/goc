// The second argument of append must resolve to the same type as the first argument's elements' type 
package foo

func main() {
    var slice, slice2 []int

    slice2 = append(slice, 5.0) // elements of slice are type int != float64
}
