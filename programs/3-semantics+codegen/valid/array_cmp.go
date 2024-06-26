// This is a test of array and slice behaviour
//~Before any changes:
//~true
//~After changes:
//~false
//~Indexing slice:  1
//~Indexing person slice:  bob
//~2.150000e+01

package main

type person struct {
	name string
	age int
}

func f(x int, f float64) string {
	var z int
	var y = x
	return "wow"
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
	println("Indexing slice: ", s[0])

	var s2 []person
	s2 = append(s2, parr1[2])
	println("Indexing person slice: ", s2[0].name)

	var f float64
	f = 21.5
	println(f)
}
