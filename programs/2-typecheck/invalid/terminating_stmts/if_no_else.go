// an if statement must have an else branch in order to be a terminating statement

package main

func f() int {
	if i := true; i {
		return 1
	} else if i {
		return 10;
	}
}
