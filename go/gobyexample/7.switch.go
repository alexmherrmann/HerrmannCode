package main
import "fmt"

func switches() {
  const limit = 25


  for i := 1; i <= limit; i++ {
    // not gonna lie... I kind of like this syntax :)
    switch {
    case i % 15 == 0:
      fmt.Println(i, "fizzbuzz")
    case i % 5 == 0:
      fmt.Println(i, " buzz")
    case i % 3 == 0:
      fmt.Println(i, " fizz")
    }
  }

}
