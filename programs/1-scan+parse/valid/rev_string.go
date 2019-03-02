package rev_string

func main() {
	s := "wow this is a nice string"
	s_len := len(s)

    foo := s[1]

	for i := 0; i < (s_len / 2); i++ {
		tmp := s[s_len - i]
		s[s_len - i] = s[i]
		s[i] = tmp
	}

	print(s)
}
