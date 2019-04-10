package main

type person struct {
	age int
}

func main() {
	var parr1, parr2 [20]person
	
	println("Before any changes:")
	println(parr1 == parr2)

	parr1[2].age = 3
	println("After changes:")
	println(parr1 == parr2)

	var bob = parr1[2]
}
