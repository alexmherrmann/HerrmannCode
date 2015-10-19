package main

import "fmt"

type myint int64 // set the type MyInt to an int64
type person struct {
	name       string
	age        int
	hascrushon *person
}

func abs(in int) int {
	if in < 0 {
		return -in
	} else {
		return in
	}
}

func structs() {
	alex := person{name: "Alex Herrmann", age: 19}
	jean := person{name: "Jean Glasser", age: 18}
	bobby := person{name: "Bobby Mcgee", age: 42}
	alex.hascrushon = &jean
	jean.hascrushon = &alex

	persons := []person{alex, jean, bobby}
	persons = append(persons, person{name: "Janice", age: 44, hascrushon: &bobby})

	for _, p := range persons {
    var diff int
    if p.hascrushon != nil {
      diff = abs(p.age-p.hascrushon.age)
    } else {
      diff = 0
    }
		fmt.Printf("name:[%15v] age:[%2v] crush:[%v] crush age difference: [%2v]\n",
      p.name, p.age, p.hascrushon, diff)
	}

}
