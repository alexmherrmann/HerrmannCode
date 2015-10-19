package main
import "fmt"

func maps() {
  m := make(map[string] int)
  m["Alex"] = 19
  m["Jeannie"] = 18
  m["Linda"] = 61

  fmt.Println("map is...", m)
  delete(m, "Linda")
  fmt.Println("map is...", m)

  last_name := map[string]string {"Alex": "Herrmann Zander", "Jean": "Glasser"}
  fmt.Println("map is...", last_name)

}
