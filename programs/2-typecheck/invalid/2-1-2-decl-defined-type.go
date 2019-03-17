package foo

type (
    integer int
    reel float64 // real is already a go type so I wrote it in french lul
)

func main() {
    var x integer = integer(5 + 6) // should be perfectly fine
    var y reel = reel(5.0 + 6.0) // also should be fine
    var z reel = 5.0 // will fail; reel != float64
}
