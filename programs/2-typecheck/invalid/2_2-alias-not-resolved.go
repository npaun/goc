// Even though two types may be aliases of each other, they are not assignment-compatible
package nanjing
type  DINOSAUR string

var a DINOSAUR
var b string = a
