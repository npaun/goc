package foo

func g(arg1 int, arg2, arg3 float64) {
    var g string; // that's fine 
}

func f(arg1 int, arg2, arg3 float64) {
    var arg3 string; // arg3 defined twice
}
