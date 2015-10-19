package main

import "fmt"

func vars() {
  var a string = "explicit string..."
  b := "implicit string..."
  fmt.Println("explicit: ", a)
  fmt.Println("implicit: ", b)

}
