package main

import "core:fmt"

smallest_num_divisible_by_1_20 :: proc() -> int {
	n: int = 0

	outer: for {
		n += 20
		inner: for i := 1; i <= 20; i += 1 {
			// fmt.printfln("n is %d, i is %d, n is divisible evenly?: %v", n,i, n%i ==0)
			if n % i != 0 {
				continue outer
			}
			if i == 20 {
				break outer
			}
		}
		break outer
	}

	return n
}

main :: proc() {
	fmt.printfln(
		"smallest num thats evenly divisible by all numbers from 1 to 20: %d",
		smallest_num_divisible_by_1_20(),
	)
}
