package main
import "fmt"
import "reflect"


/*
 * Still not sure on when to use slices or arrays, they seem to act similarly
 * LOL JK, what I thought was an array was actually a slice... silly me
 */

func input(input []string) {
  fmt.Println("I got the inputs", input, "it has length", len(input), "and type", reflect.TypeOf(input))
}

func input2d(input [][]string) {
  fmt.Println("I got the inputs", input, "it has length", len(input), "and type", reflect.TypeOf(input))
}

func slices() {

  //array
  s1 := []string{"Alex", "Herrmann"}
  input(s1)
  s1 = append(s1, "zander")
  input(s1)

  s2 := [][]string{{"Alex", "Michael", "Herrmann"}, {"Jean", "Glasser"}}
  input2d(s2)

  s2 = append(s2, s1)
  input2d(s2)

  input2d(s2[0:2])
  input2d(s2[:2])
  input2d(s2[2:])

}
