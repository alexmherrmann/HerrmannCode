package lilmdserver
import (
  "github.com/russross/blackfriday"
  "io/ioutil"
  "fmt"
)

func Render() string {
  var render blackfriday.Renderer
  extensions := 0
  extensions |= blackfriday.HTML_COMPLETE_PAGE

  render = blackfriday.HtmlRenderer(0 , "rendered page", "screen.css")

  dat, _ := ioutil.ReadFile("test.md")
  rendered := blackfriday.Markdown(dat, render, extensions)

  return string(rendered[:])
}
