package main
import "fmt"


func sumrange(input []int) int {
  sum := 0
  for _, n := range input {
    sum += n
  }
  return sum
}

var recursions = 0
func sumrecurse(input []int) int {
  // fmt.Println("got", input)
  recursions++
  if len(input) > 1 {
    return input[0] + sumrecurse(input[1:])
  } else {
    return input[0]
  }
}

func sumswitchrecurse(input []int) int {
  // fmt.Println("got", input)
  l := len(input)
  switch {
    case l > 1:
      return input[0] + sumswitchrecurse(input[1:])
    default:
      return input[0]
  }
}

// TODO: maybe run some benchmarks here!
func functions() {
  ints := []int{1,5,3,676,43,2,4,65,76}
  fmt.Println("sum (using range) of", ints, sumrange(ints))
  fmt.Println("sum (using recurse) of", ints, sumrecurse(ints), "recursions occurred:", recursions)
  fmt.Println("sum (using switched recurse) of", ints, sumswitchrecurse(ints))

}
