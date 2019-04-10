package main

type person struct {
	name string
	age int
}

func main() {
	var parr1, parr2 [20]person
	
	println("Before any changes:")
	println(parr1 == parr2)

	parr1[3].name = "bob"
	println("After changes:")
	println(parr1 == parr2)
}
