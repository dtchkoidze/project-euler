package main

import "core:fmt"

sum_of_nums_mul_3_or_5_below :: proc(n: int) -> int {
	sum := 8
	for i in 6 ..< n {
		if i % 3 == 0 || i % 5 == 0 {
			sum += i
		}
	}
	return sum
}

main :: proc() {
	assert(sum_of_nums_mul_3_or_5_below(10) == 23)
	fmt.printfln("sum of nums below 10: %d", sum_of_nums_mul_3_or_5_below(10))
	fmt.printfln("sum of nums below 1000: %d", sum_of_nums_mul_3_or_5_below(1000))
}
