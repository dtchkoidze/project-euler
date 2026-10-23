package main

import "core:strings"
import "core:fmt"
import "core:strconv"
LARGEST_THREE_DIGIT :: 999

largest_palindrome_of_three_digit_product :: proc() -> i64 {
	largest: i64
	for i:i64 = LARGEST_THREE_DIGIT; i > 0; i-=1 {
		for j:i64 = LARGEST_THREE_DIGIT; j > 0; j-=1 {
			r: i64 = j*i
			buf: [32]u8
			str := strconv.write_int(buf[:], r, 10)
			// fmt.printfln("string: %s", str)
			strlen := len(str)
			// fmt.printfln("string len: %d", strlen)
			if strlen & 1 == 0 {
				mid := strlen / 2
				left := str[:mid]
				right := str[mid:]
				right = strings.reverse(right)
				if left == right {
					// fmt.printfln("found palindrome: %d", r)
					if largest < r {
						largest = r
					}
				}
			}
		}
	}

	return largest
}

main :: proc(){
	fmt.printfln("largest palindrome of 3 digit product: %d", largest_palindrome_of_three_digit_product())
}
