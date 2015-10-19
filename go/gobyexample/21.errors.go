package main
import "errors"
import "fmt"
import "strings"


type conversionerror struct {
  offender string
  pos int
  tried string
}

func (ce conversionerror) Error() string {
  return fmt.Sprintf("{offender was char [%v] at pos [%02d] in string [%v]}", ce.offender, ce.pos, ce.tried)
}

func convert (in string) (int, error) {
  switch in {
    case "0": return 0, nil
    case "1": return 1, nil
    case "2": return 2, nil
    case "3": return 3, nil
    case "4": return 4, nil
    case "5": return 5, nil
    case "6": return 6, nil
    case "7": return 7, nil
    case "8": return 8, nil
    case "9": return 9, nil
    case "-": return -1, nil
    default: return -1, errors.New("character received was not a number or -")
  }
}

func parse_int(in string) (int, error) {
  var parsed int
  var negative bool
  for pos , c := range strings.Split(in, "") {
    parsed *= 10
    if i, e := convert(c); e == nil {

      if i == -1 {
        if pos != 0 {
          return 0, &conversionerror{offender:c, pos:pos, tried: in}
        } else {
          negative = true
        }
      } else {
        parsed += i
      }

    } else {
      return 0, &conversionerror{offender:c, pos:pos, tried: in}
      // return 0, errors.New("err: " + e.Error())
    }
  }

  if negative {
    return -parsed, nil
  } else {
    return parsed, nil
  }
}

func errorhandling() {
  strnums := []string{"-34", "867", "4-2", "543s"}
  for _, s := range strnums {
    if prsd, err := parse_int(s); err != nil{
      fmt.Println(s, "was a bad string, got err", err.Error())
    } else {
      fmt.Println(s, "was parsed to int:", prsd)
    }
  }
}
