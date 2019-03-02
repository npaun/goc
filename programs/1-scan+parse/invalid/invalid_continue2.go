// invalid continue statement in switch statement

package main

func main() {
	switch x {
		case true:
			continue
		case false:
			x := true
	}
}
