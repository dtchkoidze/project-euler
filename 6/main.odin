package main

import "core:fmt"
sum_of_squares_up_to_n :: proc(n: u64) -> u64 {
	return n * (n + 1) * (2 * n + 1) / 6
}

square_of_sum_of_n :: proc(n: u64) -> u64 {
	sum: u64 = 0
	for i in 1..<n+1 {
		sum += i
	}
	return sum*sum
}

main :: proc() {
	assert(sum_of_squares_up_to_n(10) == 385)
	assert(square_of_sum_of_n(10) == 3025)
	assert((square_of_sum_of_n(10) - sum_of_squares_up_to_n(10)) == 2640)

	fmt.printfln("for 100: %d", (square_of_sum_of_n(100) - sum_of_squares_up_to_n(100)))
}
