package array

var arr [5]int

var _ [5]int

func main() {
    arr[4] = 6
    _ := arr[3]
}
