// While you can redeclare a variable in the same scope using short variable declarations, as long as you also declare a new variable,
// you cannot redeclare a variable to a different type via this 'feature'
package douglas_mental_hospital

func _() {
	var x int
	x, y := "Dog", "Dog"
}
