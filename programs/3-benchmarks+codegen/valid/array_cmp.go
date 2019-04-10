package main

type person struct {
	name string
	age int
}

func main() {
	var parr1, parr2 [20]person
	
	println("Before any changes:")
	println(parr1 == parr2)

	parr1[2].name = "bob"
	println("After changes:")
	println(parr1 == parr2)

	var bob = parr1[2]


	var x,y int
	var f float64
	var b bool
	var s string
	var r rune
	println(x,y,f,b,s,r)

	b = parr1[2].name == parr2[2].name
	println(b)
	b = parr1[2].name != parr2[2].name
	println(b)

	println("another " + "one")
	var s2 = "name: " + parr1[2].name
	println(s2)

}
