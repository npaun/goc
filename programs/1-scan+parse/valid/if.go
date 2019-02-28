package main

func main() {
	var x,y,z = 1,2,3
	if x := 10; y < x {
		y = 5
	} else if x < y {
		y = 10
	} else {
		y = 0
	}
	var test = 10
	if y := 5; y > x {
		x = 10
	} else if y < x {
		x = 5
	} else {
		x = 0
	}
	var test2 = 100
	var test3 = 1000;
	if z := 5; z > x {
		x = 10
	} else if z < x {
		x = 5
	} else {
		x = 0
	}
	var test4 = 1
}
