// This benchmark just multiplies matrices uselessly
//~+
//~+
//~+
//~+
//~+
//~+
//~+
//~+
//~+
//~+
package main


var CYCLES  = 100
type mat [128][128]float64

func mmult(A mat, B mat) mat {
	n, m := len(A),len(A[0])
	_, p := len(B),len(B[0])

	var C mat
	for i := 0; i < n; i++ {
		for j := 0; j < p; j++ {
			for k := 0; k < m; k++ {
				C[i][j] += A[i][k] * B[k][j]
			}
		}
	}
	return C
}

var seed = 0xdeadbeef
func rand() int {
	seed = (seed * 1140671485 + 1140671485) & ((1 << 24))
	return seed
}

func rand_matrix() mat {
	var M mat
	n := len(M)
	for i := 0; i < n; i++ {
		for j := 0; j < n; j++ {
			M[i][j] = float64(rand()) +  0.000001 * float64(rand())

		}
	}
	return M
}

func main() {
	for i := 0; i < CYCLES; i++ {
		mmult(rand_matrix(),rand_matrix())
		if i % 10 == 0 {
			println("+")
		}
	}
}
