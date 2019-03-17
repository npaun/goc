package foo

type a struct {
	mem1 int
	mem2 float64
}

func main() {
    var int1 int = 1
    var int2 int = 2
    var float1 float64 = 1.0
    var float2 float64 = 2.0
    var bool1 bool = true
    var bool2 bool = false
    var string1 string = "1"
    var string2 string = "2"
    var rune1 rune = '1'
	var rune2 rune = '2'
	var struct1 a
	var struct2 a
	var arr1 [5]int
	var arr2 [5]int
	var arr3 [5]float64
	var arr4 [5]float64
	var arr5 [5]bool
	var arr6 [5]bool
	var arr7 [5]rune
	var arr8 [5]rune
	var arr9 [5]a
	var arr10 [5]a

	// addition, type of var is expected type
	var sum1 int = int1 + int2
	var sum2 int = int2 + int1
	var sum5 float64 = float1 + float2
	var sum6 float64 = float2 + float1
	var sum9 string = string1 + string2
	var sum7 rune = rune1 + rune2
	var sum8 rune = rune2 + rune1

	// difference, type of var is expected type
	var dif1 int = int1 - int2
	var dif2 int = int2 - int1
	var dif5 float64 = float1 - float2
	var dif6 float64 = float2 - float1
	var dif7 rune = rune1 - rune2
	var dif8 rune = rune2 - rune1
	// quotient, type of var is expected type
	var quo1 int = int1 / int2
	var quo2 int = int2 / int1
	var quo5 float64 = float1 / float2
	var quo6 float64 = float2 / float1
	var quo7 rune = rune1 / rune2
	var quo8 rune = rune2 / rune1
	// product, type of var is expected type
	var pro1 int = int1 * int2
	var pro2 int = int2 * int1
	var pro5 float64 = float1 * float2
	var pro6 float64 = float2 * float1
	var pro7 rune = rune1 * rune2
	var pro8 rune = rune2 * rune1

    // remainder, only ints
    var rem int = int1 % int2
    // bitwise AND, int only
    var and int = int1 & int2
    // bitwise OR, int only
    var or int = int1 | int2
    // bitwise XOR, int only
    var xor int = int1 ^ int2
    // bitwise clear (AND NOT), int only
    var clear int = int1 &^ int2
    // left shift, int only, signed types allowed in golite
    var ls int = int1 << int2
    // right shift, int only, signed types allowed in golite
    var rs int = int1 >> int2
    // comparison operators
    var comp1 bool = int1 == int2
    var comp2 bool = int1 != int2
    var comp3 bool = float1 == float2
    var comp4 bool = float1 != float2
    var comp5 bool = bool1 == bool2
    var comp6 bool = bool1 != bool2
    var comp7 bool = string1 == string2
    var comp8 bool = string1 != string2
    var comp9 bool = rune1 == rune2
    var comp10 bool = rune1 != rune2
    // ordered
    var ord1 bool = int1 <= int2
    var ord2 bool = int1 < int2
    var ord3 bool = int1 >= int2
    var ord4 bool = int1 > int2
    var ord5 bool = float1 <= float2
    var ord6 bool = float1 < float2
    var ord7 bool = float1 >= float2
    var ord8 bool = float1 > float2
    var ord9 bool = string1 <= string2
    var ord10 bool = string1 < string2
    var ord11 bool = string1 >= string2
    var ord12 bool = string1 > string2
    var ord13 bool = rune1 <= rune2
    var ord14 bool = rune1 < rune2
    var ord15 bool = rune1 >= rune2
    var ord16 bool = rune1 > rune2
    // logical
    var log1 bool = bool1 || bool2
    var log2 bool = bool1 && bool2

	// struct, array
	// structs are comparable (==, !=) if all their fields are comparable
	var compstruct1 bool = struct1 == struct2
	var compstruct2 bool = struct1 != struct2

	// arrays are comparable if the elems are comparable
	var comparr1 bool = arr1 == arr2
	var comparr2 bool = arr1 != arr2
	var comparr3 bool = arr3 == arr4
	var comparr4 bool = arr3 != arr4
	var comparr5 bool = arr5 == arr6
	var comparr6 bool = arr5 != arr6
	var comparr7 bool = arr7 == arr8
	var comparr8 bool = arr7 != arr8
	var comparr9 bool = arr9 == arr10
	var comparr10 bool = arr9 != arr10
}

