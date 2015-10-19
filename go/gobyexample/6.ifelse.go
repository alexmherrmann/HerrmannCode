package main
import "fmt"

func ifelse() {
  prime_limit := 25
  fmt.Println("Now we're going to find all the prime numbers up to...", prime_limit)

  for i:=3; i<= prime_limit; i++ {
    var prime bool = true // nice and explicit :)
    for j:= 0; j<=i; j++ {
      if i != j && i%j == 0 {
        prime = false
        break
      }
    }

    fmt.Printf("%d is prime? : %t\n", i, prime)
  }
}
