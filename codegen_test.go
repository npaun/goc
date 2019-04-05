package main

var x int
var y = 2.1
var z = "wow"

func f(a int) int {
	var x, y int
	return 0
}

func exp_test() {
	var x, y, z int

	var t = x + y
	var t2 = -x
	var t3 = f(x)
	var t4 = int(x)

	var t5 = true
	var t6 = false
	var t7 = 101
	var t8 = 1.10
	var t9 = "string"
	var t10 = 'r'
}

func assign_test() {
	var x, y int

	x = y
	x = 10 + y
	y,_,x = x, 10, 0
	x,_,y = y, 100, 1
}

func opassign_test() {
	var x, y int

	x += y
	x >>= y
	x *= y
	y += 1
}

func inctest() int {
	var x = 10
	x++
	x--

	return x
}

func iftest() {
    var x = 10
    var y = 5

    if z := 15; x > z {
        y = x
    } else if yy := "swag"; false {
        println(yy)
    } else if zz, zzz := 15, 20; y == 5 {
        y = z
    } else {
        x = y
    }
}

func switchtest() {
    var x int
    switch y := 5; x {
        case 1, 2, 3:
            iftest()
        case 4, 5:
            y = 10
        default:
            y += 10
    }
}

func print_test() {
	var i = 5
	var s = "string"
	var b = true
	var f = 1.0
	var r = 'r'

	println(i,s,b,f,r)
}
func main() {
	println("Hello world!")
	print_test()
}
