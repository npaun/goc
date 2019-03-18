// function parameters types must be identical in func call 
package main

func test(a int, b float64) int {

}

func main() {
	x,y := 1, 2
	z := test(x,y)
}
