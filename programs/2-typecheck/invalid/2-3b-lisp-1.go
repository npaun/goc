// Golite is a Lisp-1 (one name space for functions and variables)
package smurfpackage
func smurf(smurf int) int {
	return 1 * smurf(smurf - 1)
}
