package main
import "fmt"
import "strings"

func ranges() {
  names := []string {"Alex Herrmann", "Jean Glasser", "Java sucks!", "Go Rules!"}

  for _, s := range names {
    fmt.Println("got string", s)
  }

  for i, s := range names {
    fmt.Println(i, "->", s)
  }

  last_map := map[string]string{"Alex" :"Herrmann", "Jean": "Glasser", "Go": "kinda cool :)"}

  for key, val := range last_map {
    fmt.Println(key, "->", val)
  }

  vowels := "AEIOUaeiou"
  vowel_count := 0
  word := "Alex"

  for i , char := range strings.Split(word, "") {
    if strings.ContainsAny(vowels, char) {
      fmt.Println("found vowel", char, "at", i)
      vowel_count++
    }
  }

  fmt.Println(word, "has", vowel_count, "vowels")
}
