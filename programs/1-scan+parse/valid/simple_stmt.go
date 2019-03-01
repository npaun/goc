package main

func main() {
	x,y,z = 1,2,3
	f,z := "wow", "another"

	x += 5
	x -= 5
	x &= 5
	x |= 5
	x *= 5
	x /= 5
	x ^= 5
	x <<= 5
	x >>= 5
	x %= 5
	x &^= 5

	x++
	x--

	print(x,y, y+10)
	println(somefunc(), wow.x)

	// expr are considered simple_stmt's
	5 + 5
	"wow"
	-100
}
