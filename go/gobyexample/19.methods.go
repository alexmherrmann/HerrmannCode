package main
import "fmt"

type position struct {
  x, y int
}

type car struct {
  name string
  pos position
}

// pointer to modify car
func (c *car) goTo(x, y int) {
  c.pos = position{x:x, y:y}
}

// nothing is modified
func (c car) stat() {
  fmt.Printf("%-12v @ %5v\n", c.name, c.pos)
}

func methods() {
  c1 := car{name: "Alex's XB", pos: position{x: 4, y: -2}}
  c1.stat()
  c1.goTo(-2, 6)
  c1.stat()

}
