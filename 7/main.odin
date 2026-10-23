package main

import "core:fmt"

is_prime :: proc(n: u64) -> bool {
	if n <= 1 {
		return false
	}

	for i: u64 = 2; i < n; i += 1 {
		if n % i == 0 {
			return false
		}
	}
	return true
}

nth_prime :: proc(n: u64) -> u64 {
	i: u64 = 1
	c: u64
	for {
		i1, i2, i3, i4: u64
		i1 = i + 0
		i2 = i + 1
		i3 = i + 2
		i4 = i + 3

		if is_prime(i1) {
			c+=1
			if c == n {
				fmt.printfln("primes seen: %d, current i: %d", c, i)
				return i1
			}
		}
		if is_prime(i2) {
			c+=1
			if c == n {
				fmt.printfln("primes seen: %d, current i: %d", c, i)
				return i2
			}
		}
		if is_prime(i3) {
			c+=1
			if c == n {
				fmt.printfln("primes seen: %d, current i: %d", c, i)
				return i3
			}
		}
		if is_prime(i4) {
			c+=1
			if c == n {
				fmt.printfln("primes seen: %d, current i: %d", c, i)
				return i4
			}
		}
		i += 4
	}

	return 0
}

main :: proc() {
	fmt.printfln("second prime: %d", nth_prime(2))
	assert(nth_prime(2) == 3)
	fmt.printfln("sixth prime: %d", nth_prime(6))
	assert(nth_prime(6) == 13)
	fmt.printfln("10_001 prime: %d", nth_prime(10_001))
}
