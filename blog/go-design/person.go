package main
import "fmt"

type person struct {
  name string
}

func (p person) say(in string) {
  fmt.Println(p.name, "says:", in)
}

func main() {
  Alex := person{name:"Alex"}
  Alex.say("Hello World!")
}
