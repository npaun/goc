package main

type wow string
type cool wow

type f float64

func main() {
	var a f = f(1.1)
	var x cool = cool(a)
}
