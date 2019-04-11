// This file implements the Blum-Blum-Shub random number generator and does it over
// and over again. Using this tool, you can passwords over and over again.
package main

var CYCLES int = 0x003aaaaa // Adjust the last few digits to get a precise result, assuming my laptop
// Two large primes
var p, q = 15485863, 17144489
var M = p*q
// Initial seed should be coprime to p and q
var x =  809397

func digit() int {
	x = ((x * x) % M)
	return x & 1
}

func randint() int {
	num := 0
	for i := 0; i < 32; i++ {
		num |= digit() << i
	}
	return num
}

var w [16]string
func init() {
	w[0],w[1],w[2],w[3] = "aardvark", "backwater", "candidate", "decadence"
	w[4],w[5],w[6],w[7] = "embezzle", "fascinate", "gadgetry", "hamburger"
	w[8],w[9],w[10],w[11] = "indoors","jawbone","keyboard","locale"
	w[12],w[13],w[14],w[15] = "merit","neptune","obtuse","payday"
}

func chr(num int,idx int) string {
	// This is probably not an appropriate way to convert to ASCII, but whatevs
	return string(32 + (((num >> idx) & 0xFF) % 94))
}


func to_password(a int, b int) string {
	return chr(a,24) + chr(a,16) + chr(a,8) + chr(a,0) + chr(b,24) + chr(b,16) + chr(b,8) + chr(b,0)
}

func  main() {
	for i := 0; i < CYCLES; i++ {
		a, b := randint(), randint()
		if i % 1000000 == 0 {
			println("Your ",i,"th new password is ",to_password(a,b),". Yay....")
		}
	}
}

