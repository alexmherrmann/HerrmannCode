package main
import "fmt"
import "time"
// import "math/rand"


func channels() {
  chan1 := make(chan string)

  fmt.Println("starting goroutine, and then waiting for something to get dropped into our channel")
  go func() {
    time.Sleep(3 * time.Second)
    chan1<- "ayy lmao"
  }()

  fmt.Println(<-chan1)

}
