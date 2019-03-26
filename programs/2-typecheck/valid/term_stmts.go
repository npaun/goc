package main


func f() int {
	return 1
}

func f2() int {
	for {

	}
}

func f3() int {
	for i := 0; ; i++ {

	}
}

func f4() int {
	if i := 1; i < 10 {
		return 1
	} else {
		return 0
	}
}

func f5() int {
	switch i := 1; i {
	case 0:
		return 1
	case 1:
		return 0
	default:
		return -1
	}
}

func f6() int {
	switch i := 1; i {
	case 0:
		return 1
	case 1:
		fallthrough
	default:
		return -1
	}
}
