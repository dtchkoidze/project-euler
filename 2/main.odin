package main

import "core:c"
import "core:fmt"
import "core:math"

sum_of_even_num_fib_terms :: proc(limit: u64 = 4_000_000) -> u64 {
	current_term: u64 = 3
	prev_1: u64 = 2
	prev_2: u64 = 1
	sum: u64 = 2

	for {
		tmp_prev_1: u64 = current_term
		prev_2 = prev_1
		prev_1 = tmp_prev_1
		current_term = prev_1 + prev_2
		if current_term > 4_000_000 {
			break
		}

		if (current_term & 1) == 0 {
			sum += current_term
		}
	}
	return sum
}

main :: proc() {
	fmt.printfln("sum of all even numbers when max term is under 4mil: %d",  sum_of_even_num_fib_terms())
}
