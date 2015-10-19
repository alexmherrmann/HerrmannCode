package main
import "fmt"
import "net/http"
import "encoding/json"
import "io/ioutil"

type any interface{}


func tomap(in interface{}) map[string]interface{} {
  return in.(map[string]interface{})
}

func getquoteofday(toputin chan<- string) {
  get, _ := http.Get("http://api.icndb.com/jokes/random")
  dat, _ := ioutil.ReadAll(get.Body)
  var decode interface{}
  json.Unmarshal(dat, &decode)

  amap := tomap(decode)
  toputin<- tomap(amap["value"])["joke"].(string)
}

func chansync() {

  fmt.Println("Starting up")
  qodchan := make(chan string)
  go getquoteofday(qodchan) // let's get a quote
  fmt.Println("waiting on quote of day...")
  fmt.Println("got (chuck norris) quote of the day: ", <-qodchan)

}
