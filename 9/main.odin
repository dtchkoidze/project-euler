package main

import "core:fmt"

yield_triplet :: proc(m: u64, n: u64) -> (u64, u64, u64, bool) {
	MAX :: max(u64)

	if m <= n {
		return 0, 0, 0, false
	}

	if m > MAX / m || n > MAX / n {
		return 0, 0, 0, false
	}

	mm := m * m
	nn := n * n

	if mm > MAX - nn {
		return 0, 0, 0, false
	}

	a := mm - nn
	b := 2 * m * n
	c := mm + nn

	return a, b, c, true
}

sum_triplet :: proc(a, b, c: u64) -> u64 {
	// fmt.printfln("sum args: %d%d%d", a, b, c)
	return a + b + c
}

product_of_triplet_with_sum_of_n :: proc(n: u64) -> u64 {
	a, b, c: u64
	ok: bool

	outer: for k: u64 = 2;; k += 1 {
		j: u64 = 1
		for j: u64 = 1; j < k; j += 1 {
			a, b, c, ok = #force_inline yield_triplet(k, j)
			if !ok {
				fmt.printfln("ok will overflow u64 continue outer")
				break outer
			}
			sum := #force_inline sum_triplet(a, b, c)
			if sum == n {
				fmt.printfln("found triplet with sum of n: %d %d %d", a, b, c)
				break outer
			}

			// if sum > n {
			// 	str := fmt.aprintf("bullshit happened sum: %d, n: %d", sum, n)
			// 	panic(str)
			// }
		}
	}

	return a * b * c
}

main :: proc() {
	fmt.printfln("product of triplet with sum of 1000: %d", product_of_triplet_with_sum_of_n(1000))
}
