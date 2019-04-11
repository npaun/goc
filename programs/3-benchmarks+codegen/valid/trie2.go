// This implements a trie data structure to store ID to name lookups
package main

var KEYS, SEARCHES, ROUNDS = 500000, 10, 15

type entry struct {
	data string // The data to store with a node	
	chld [10]int // Slots for swizzled pointers for 10 possible children
}

func unpack(key int) [9]int {
	var  r [9]int
	for i := len(r) - 1; i >= 0; i-- {
		r[i] = key % 10
		key /= 10
	}
	return r
}

func trie_insert(t []entry, key int, data string) []entry {
	cur := 0
	{
		key := unpack(key)
		for i := 0; i < len(key); i++ {
			key := key[i]
			// See if we need a new entry
			if t[cur].chld[key] == 0 {
				var nent entry
				slot := len(t)
				t = append(t,nent)
				t[cur].chld[key] = slot
			}

			cur = t[cur].chld[key]
		}

		// Current should now be an empty slot
		t[cur].data = data
	}
	return t
}


func trie_search(t []entry, key int) string {
	cur := 0
	{
		key := unpack(key)
		for i := 0; i < len(key); i++ {
			key := key[i]
			if t[cur].chld[key] == 0 {
				return "NOTFOUND"
			}
			cur = t[cur].chld[key]
		}
		return t[cur].data
	}
}

func bench() {
	var t []entry
	var root entry
	t = append(t,root)
	for i := 0; i < KEYS; i++ {
		switch  i % 3 {		
			case 0: t = trie_insert(t,i,"elephant")
			case 1: t = trie_insert(t,i,"marmot")
			case 2: t = trie_insert(t,i,"panther")
		}
	}

	for i,k := 0,0; i < SEARCHES; i,k = i + 1, k * 11 {
		println(trie_search(t,i))
	}
}

func main() {
	for i := 0; i < ROUNDS; i++ {
		println("-------------------------")
		bench()
		println("")
	}
}

