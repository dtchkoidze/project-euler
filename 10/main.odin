package main

import "core:fmt"
import "core:math"

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

sieve_of_eratosthenes_sum_of_primes_below_n :: proc(n: u64) -> u64 {
	a := make([]bool, n)
	defer delete(a)

	for p: u64 = 2; p * p < n; p += 1 {
		if a[p] {
			continue
		}

		for j: u64 = p * p; j < n; j += p {
			a[j] = true
		}
	}

	sum: u64

	for i: u64 = 2; i < n; i += 1 {
		if !a[i] {
			sum += i
		}
	}


	return sum
}

sum_of_primes_below_n :: proc(n: u64) -> u64 {
	sum: u64
	for i in 0 ..< n {
		if is_prime(i) {
			sum += i
		}
	}
	return sum
}

main :: proc() {
	assert(sum_of_primes_below_n(10) == 17)
	fmt.printfln("sieve of era sum of primes below 10: %d", sieve_of_eratosthenes_sum_of_primes_below_n(10))
	assert(sum_of_primes_below_n(10) == sieve_of_eratosthenes_sum_of_primes_below_n(10))
	fmt.printfln("sum of primes below two million: %d", sieve_of_eratosthenes_sum_of_primes_below_n(2_000_000))
}
