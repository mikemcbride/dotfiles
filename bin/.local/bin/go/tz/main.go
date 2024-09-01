package main

import (
	"fmt"
	"time"
)

func main() {
	now := time.Now()

	peeps := []string{}
	loc, _ := time.LoadLocation("America/New_York")
	fmt.Printf("Eastern:  %s\n", now.In(loc).Format(time.Kitchen))
	peeps = append(peeps, "Grizz:  "+now.In(loc).Format(time.Kitchen))
	peeps = append(peeps, "Max:    "+now.In(loc).Format(time.Kitchen))
	peeps = append(peeps, "Danny:  "+now.In(loc).Format(time.Kitchen))

	loc, _ = time.LoadLocation("America/Chicago")
	fmt.Printf("Central:  %s\n", now.In(loc).Format(time.Kitchen))
	peeps = append(peeps, "Mike:   "+now.In(loc).Format(time.Kitchen))

	loc, _ = time.LoadLocation("America/Denver")
	fmt.Printf("Mountain: %s\n", now.In(loc).Format(time.Kitchen))
	peeps = append(peeps, "Adrian: "+now.In(loc).Format(time.Kitchen))

	loc, _ = time.LoadLocation("America/Los_Angeles")
	fmt.Printf("Pacific:  %s\n", now.In(loc).Format(time.Kitchen))
	peeps = append(peeps, "Kelly:  "+now.In(loc).Format(time.Kitchen))
	peeps = append(peeps, "Tony:   "+now.In(loc).Format(time.Kitchen))

	fmt.Println("---------------------")
	for _, p := range peeps {
		fmt.Println(p)
	}
}
