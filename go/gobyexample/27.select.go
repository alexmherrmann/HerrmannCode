package main
import "fmt"
import "time"


func selects() {
  msg := make(chan string)
  done := make(chan bool)

  msgr := func() {
    time.Sleep(1 * time.Second)
    msg <- "hallo!"
  }

  count := 0
  counter := func() {
    time.Sleep(time.Duration(1.5 * float32(time.Second)))
    count++

    if count > 4 {
      done <- true
    } else {
      done <- false
    }
  }

  run := true

  for run {
    go msgr()
    go counter()
    select {
    case rmsg := <-msg:
      fmt.Println("Got a value", rmsg)
    case isdone := <-done:
      run = !isdone
      fmt.Println("continue running?:", run)
    }
  }

}
