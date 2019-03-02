package main

func is_palindrome(s string) bool {
	l := len(s)

	for i := 0 ; i < l ; i++ {
		if s[i] != s[l - i] {
			return false
		}
	}

	return true
}

func main() {
	s := "aabbaa"

	s_is_pal = is_palindrome(s)
}
