package main
import "fmt"
func main() {
  nums := []int{1,2,3,4,5,6}
  sum := 0
  for _, n := range nums {
    sum +=n
  }
  fmt.Println(sum)
}
