package main

func main() {
	var x,y = 1,2

	if x := 10; y < x {
		y = 5
	} else if x < y {
		y = 10
	} else {
		y = 0
	}
}
