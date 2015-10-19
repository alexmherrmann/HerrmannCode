package main
import "fmt"

func sumit(nums ...int) int {
  lilsum := 0
  for _, i := range nums {
    lilsum += i
  }
  return lilsum
}

func variadic() {
  sumnums := []int{4,2,6,2,2,3,634,65}

  fmt.Println("summing", sumnums, "is", sumit(sumnums...))
}
