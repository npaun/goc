//~Next 1000000th perm generated = 165028934
//~Next 1000000th perm generated = 328971
//~Next 1000000th perm generated = 4805976
//~Next 1000000th perm generated = 64795012
//~Next 1000000th perm generated = 81357264
//~Next 1000000th perm generated = 961830247

package main

var MAX_SIZE = 10
var count = 0

func generate_perms(acc []int, selection []int, start int) {
	count++
	if(start == (len(selection) - 1)) {
		return
	}
	
	l := len(selection)
	
	for i := start; i < l; i++ {
		var cur = selection[i]

		var new_slice []int
		for j := 0; j < len(acc ); j++ {
			new_slice = append(new_slice, acc [j])
		}
		new_slice = append(new_slice, cur)
		
		if (count % 1000000) == 0 {
			print("Next 1000000th perm generated = ")
			for j := 0; j < len(new_slice); j++ {
				print(new_slice[j])
			}
			print("\n")
		}
		
		selection[i],selection[start] = selection[start], selection[i]
		generate_perms(new_slice , selection, start + 1)
		selection[i],selection[start] = selection[start], selection[i]		
	}
}
func main() {
	var s []int
	for i := 0; i < MAX_SIZE ; i++ {
		s = append(s, i)
	}

	var init []int
	generate_perms(init, s, 0)
}
