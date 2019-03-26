package main

func f() int {
	switch i := 0; i {
	case 1:
		y := 0
		break
	case 2:
		return 0
	case 3:
		return 1
	default:
		return -1
	}
}
