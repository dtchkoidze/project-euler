package main

import "core:fmt"

main :: proc() {
	sum: int
	for i:= 0; i < 671_000; i+=1 {
		sq := i*i
		if sq & 1 != 0 {
			sum += sq
		}
	}
	fmt.printfln("sum: %d", sum)
}
