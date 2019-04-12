package main

var x int
var y = 2.1
var z = "wow"

type person struct {
    name string
    age int
    friend_names [100]string
}

var p person


func arr() [10]int {
    var x [10]int
    x[1] = 20

    return x
}

func struct_test() {
    type s1 struct {
        i int
        f float64
        s2 struct {
            age int
            st string
        }
    }
}

func array_test() {
    var x [100]int
    var y [100]float64
    var z [20]string
    var x2 [10]int
    var p [20]person

    type arr [10]int
    var a [30]arr
}

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

    if true {
        println("fun")
    }

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
    var xx string = "foo"
    switch z := "foo2"; xx {
        case "foo", "bar", "swag":
            iftest()
        case "hey", "dawg":
            x = 10
        default:
            x += 10
    }
    switch {
        case xx == "foo":
            iftest()
        default:
            iftest()
    }
}

func fortest() {
    var x = 0
    
    var y = 0
    for y < 1000 {
        y++
    }
    
    for i := 1; i < 1000; i = i + 1 {
        if (i % 2 == 0) {
            continue
        }
        y--
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

func index_test() {
    var i [5]int
    y := i[3]

    var j [10]float64
    z := j[4 + 3]
}

func len_cap_test() {
    var arr [5]string
    println(len(arr))
    println(cap(arr))
    var slc []string
    slc = append(slc, "foo")
    println(len(slc))
    println(cap(slc))
}

func shadow_test(n int) float64 {
    {
        var n float64 = float64(n) * float64(n)
        return n
    }
}

func init() {
    var x = 10
    var p person
    p.name = "Bob"
    println("INIT 1")
    println(x, p.name)
}

func init() {
    println("INIT 2")

    var x,y = 10,20
    println(x,y)
}

func init() {
    println("INIT 3")
}

func init() {
    println("INIT 4")
}

func main() {
    println("Hello world!")
    struct_test();
    fortest();
    switchtest();

    var ting = shadow_test(5)

    type a1 [][2]int
    type a2 [2][]int
    type a3 struct {
        f1 a1
        f2 a2
        s []float64
    }
}
