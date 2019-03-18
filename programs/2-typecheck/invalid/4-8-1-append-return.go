// the slice to which the result of append is assigned must have the same element type as the result of append 
package foo

func main() {
    var slice, slice2 []int
    var slice3 []float64

    slice2 = append(slice, 5) // correct
    slice3 = append(slice2, 15) // incorrect
}
