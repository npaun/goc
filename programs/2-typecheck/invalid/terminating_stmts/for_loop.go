// a for loop with a loop expression is not a terminating statement
package main

func f() int {
	for i := 0; true; i++ {
		return 0
	}
}
