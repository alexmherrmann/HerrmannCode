package main
import "fmt"

/* let's print 1-20 using a variety of for loops
 *
 *
 */
func fors() {
  i := 1
  for i < 4 {
    fmt.Println(i)
    i++
  }

  for i <= 6 {
    fmt.Println(i)
    i++
  }

  for j:= 7; j <= 12; j++ {
    fmt.Println(j)
  }

  k := 13
  for {
    if k <= 20 {
      fmt.Println(k)
      k++
    } else {
      fmt.Println("all done!")
      break
    }
  }
}
