// This benchmark program computes Fibonacci numbers. Boring, right.
// It is designed to be tunable to consume the desired amount of time,
// as well as compare the performance of a (1) naive recursive, 
// (2) memoized recusive, (3) iterative implementation.
// We use the type float64 as it's one of the only ones that is consistent
// accross different Go installations, and the Golite spec.

package main

var runs = 4
var fn = 40.0

// Naive recursive

func fib_rec(n float64) float64 {
	switch n {
		case 0.0:
			return n
		case 1.0:
			return n
		default:
			return fib_rec(n-2.0) + fib_rec(n-1.0)
	}
	return -1.0
}

// Memoized

var fib_memo_table []float64
func fib_memo_init() {
	var new_tbl []float64
	new_tbl = append(new_tbl,0.0)
	new_tbl = append(new_tbl,1.0)
	fib_memo_table = new_tbl
}

func fib_memo(n float64) float64 {
	if k := int(n); k < len(fib_memo_table) {
		return fib_memo_table[k]
	} else {
		res := fib_memo(n-2.0) + fib_memo(n-1.0)
		fib_memo_table = append(fib_memo_table,res)
		return res
	}

	return -1.0
}

// Iterative 
func fib_iter(n float64) float64 {
	f0, f1 := 0.0, 1.0
	for n-- ; n > 0.0; n-- {
		ft := f0 + f1
		f0,f1 = f1, ft
	}
	return f1
}

func main() {
	println("Naive recursive")
	for i := 0; i < runs; i++ {
		println(fib_rec(fn))
	}

	println("Memoized recursive")
	for i := 0; i < runs; i++ {
		fib_memo_init()
		println(fib_memo(fn))
	}

	println("Iterative")
	for i := 0; i < runs; i++ {
		println(fib_iter(fn))
	}
}
