package main
import "fmt"


// hehe you DUMB FUNC
func dumbfunc() (string, int) {
  return "Alex Herrmann", 19
}

func mvfuncs () {
  var a, b = dumbfunc()
  fmt.Println("name", a, "age", b)
}
