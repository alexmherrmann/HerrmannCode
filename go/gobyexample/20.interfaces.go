package main

import "fmt"
import "time"

func logstring(lvl levelspec) string {
	switch {
	case lvl&DEBUG == DEBUG:
		return "DBG"
	case lvl&INFO == INFO:
		return "INF"
	case lvl&WARN == WARN:
		return "WRN"
	case lvl&ERROR == ERROR:
		return "ERR"
	default:
		return "BADLVL"
	}
}

type prefixable interface {
	prefix(string) string
	// prefixfunc() func(string) string
}

type hiperson struct {
	name string
}

type levelspec int
type simplelogger struct {
	level    levelspec
	showdate bool
}

const (
	DEBUG levelspec = 1 << iota
	INFO
	WARN
	ERROR
)

func (hp hiperson) prefix(in string) string {
	return fmt.Sprintf("[%-8s] says: %s]", hp.name, in)
}

func (l simplelogger) prefix(in string) string {
	var rstr string
	if l.showdate {
		rstr = fmt.Sprintf("[%s:%20v]>%s", logstring(l.level), time.Now(), in)
	} else {
		rstr = fmt.Sprintf("[%v]>%s", logstring(l.level), in)
	}
	return rstr
}


func interfaces() {
	prefixes := []prefixable{simplelogger{level: DEBUG, showdate: true},
		simplelogger{level: INFO, showdate: false},
		hiperson{name: "Alex"}}
	words := []string{"Some text", "and even more text", "JEANNIE HOT AF"}
	for _, p := range prefixes {
		for _, w := range words {
			fmt.Println(p.prefix(w))
		}
	}
}
