// Regression test to ensure that if you first declare a variable as `AUTO we won't be fooled into re-inferring it to a different type
// on a redeclaration
package ruh_roh

func _() {
	var b = 900
	b, c := 'N', 'O'
}
