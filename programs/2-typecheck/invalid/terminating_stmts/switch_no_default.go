package main

func f() int {
	switch i := 0; i {
	case 1:
		return 0
	case 2:
		return -1
	}
}
