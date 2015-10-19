package main
import "fmt"
import "time"

func bufferedchan() {
  msgs := make(chan string, 3)

  msgs<-"Hello"
  msgs<-"from..."

  go func() {
    time.Sleep(2 * time.Second)
    msgs <- "Alex!"
  }()

  for i:=0;i<3;i++ {
    fmt.Println(<-msgs)
  }
}
