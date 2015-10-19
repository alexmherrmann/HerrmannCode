package main
import "fmt"

func addto (oint *int, toadd int) {
  *oint = *oint + toadd
}

func pointers () {
  i := 4
  i2 := 6
  fmt.Println("i is", i, "i2 is", i2)
  fmt.Println("add i2 to i")
  addto(&i, i2)
  fmt.Println("i is", i, "i2 is", i2)
}
