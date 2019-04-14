// Tests whether anonymous structs become correctly typedefed in C
//~yellow
package main

func color(clr struct {
	n int
	vals [3]struct {
		on bool
	}
	}) {

	if clr.vals[0].on {
		if clr.vals[1].on {
			println("yellow")
		} else if clr.vals[2].on {
			println("magenta")
		} else {
			println("red")
		}
	} else if clr.vals[1].on {
		if clr.vals[2].on {
			println("cyan?")
		} else {
			println("green")
		}
	} else if clr.vals[2].on {
		println("blue")
	} else {
		println("black")
	}
}

func main() {
	var b struct {
        n int
        vals [3]struct {
                on bool
        }
	}

	b.vals[0].on,b.vals[1].on,b.vals[2].on = true, true, false
	color(b)
}
