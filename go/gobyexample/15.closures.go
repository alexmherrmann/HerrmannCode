package main
import "fmt"

// get a function that adds our name to a string
func addname(input string) func(string) string {
  return func(input2 string) string{
    return input + "> "  + input2
  }
}

func closures() {
  s1 := "closure"
  f1 := func() string{
    // we DO have access to parent scopes, obviously
    return "this is a " + s1
  }

  fmt.Println(f1())

  alex := addname("alex")
  jean := addname("jean")

  fmt.Println(alex("ayy lmao"))
  fmt.Println(jean("is love!"))


}
