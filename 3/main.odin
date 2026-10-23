package main

import "core:fmt"

largest_factor :: proc(n: u64) -> u64 {
    ncpy := n
    biggest: u64 = 0

    for ncpy % 2 == 0 {
        biggest = 2
        ncpy /= 2
    }

    for i: u64 = 3; i <= ncpy / i; i += 2 {
        for ncpy % i == 0 {
            biggest = i
            ncpy /= i
        }
    }

    if ncpy > 1 {
        biggest = ncpy
    }

    return biggest
}

main :: proc() {
	fmt.printfln("largest prime factor of 13195: %d", largest_factor(13195))
	fmt.printfln("largest prime factor of 600851475143: %d", largest_factor(600851475143))
}
