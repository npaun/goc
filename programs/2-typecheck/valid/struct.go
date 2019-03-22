package main

type point struct {
	x, y, z int
}

type point2 struct {
	_, y, z int
}

func main() {
	var x point
	var y point2
}
