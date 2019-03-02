// semicolon inserted after identifier in var decl causes parse error

package main

func main() {
	var a /* this is a block 
		   comment */ int
}
