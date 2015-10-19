package main
import "fmt"
import "time"
import "math/rand"
import "runtime"

// OHMIGAWDITSTHEGOROUTINETIME

func printafter(in string, ms time.Duration) {
  runtime.Gosched()
  time.Sleep(ms)
  fmt.Println(in)
}
func goroutines() {
  var dur time.Duration = 1 * time.Second
  fmt.Printf("waiting [%4v] seconds to print hi\n", dur)
  printafter("hi", dur)

  fmt.Println("starting 15 goroutines, sleeping for 6 seconds")

  for i:=0; i<15; i++ {
    var rsecs time.Duration = time.Duration(rand.Float32() * float32(time.Second))
    fmt.Printf("printing [%02v] after [%.4f] seconds\n", i, float32(rsecs)/float32(time.Second))
    go printafter(fmt.Sprintf("%02v", i), rsecs)
  }

  time.Sleep(6 * time.Second)
}
