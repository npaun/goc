// This is a test of structure comparison behaviour
//~Before assign:
//~false
//~After assign:
//~true

package main

type person struct {
	name string
	age int
}

type vec3 struct {
	x,y,z int
}

type household struct {
	family [5]person
	address string
}

func main() {
	var bob, jack person
	
	bob.name = "Bob"
	bob.age = 20
	jack.name = "Jack"
	jack.age = 21

	println("Before assign:")
	println(bob == jack)

	jack = bob
	println("After assign:")
	println(bob == jack)

	var x,y [100]int

	x = y
}
