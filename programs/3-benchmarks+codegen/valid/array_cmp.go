package main

type person struct {
	name string
	age int
}

func main() {
	var x,y int
	x,_,y = 10, 20, 30
	var parr1, parr2 [20]person
	
	println("Before any changes:")
	println(parr1 == parr2)

	parr1[2].name = "bob"
	println("After changes:")
	println(parr1 == parr2)

	var s []int
	s = append(s, 1)

	var s2 []person
	s2 = append(s2, parr1[2])
}
