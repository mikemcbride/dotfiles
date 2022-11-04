package main

import (
	"fmt"
	"time"
)

func main() {
	now := time.Now()

	loc, _ := time.LoadLocation("America/New_York")
	fmt.Printf("Eastern:  %s\n", now.In(loc).Format(time.Kitchen))

	loc, _ = time.LoadLocation("America/Chicago")
	fmt.Printf("Central:  %s\n", now.In(loc).Format(time.Kitchen))

	loc, _ = time.LoadLocation("America/Denver")
	fmt.Printf("Mountain: %s\n", now.In(loc).Format(time.Kitchen))

	loc, _ = time.LoadLocation("America/Los_Angeles")
	fmt.Printf("Pacific:  %s\n", now.In(loc).Format(time.Kitchen))
}
