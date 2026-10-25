package main

import "core:c"
import "core:fmt"
BULLSHIT := [][]u8 {
	{08, 02, 22, 97, 38, 15, 00, 40, 00, 75, 04, 05, 07, 78, 52, 12, 50, 77, 91, 08},
	{49, 49, 99, 40, 17, 81, 18, 57, 60, 87, 17, 40, 98, 43, 69, 48, 04, 56, 62, 00},
	{81, 49, 31, 73, 55, 79, 14, 29, 93, 71, 40, 67, 53, 88, 30, 03, 49, 13, 36, 65},
	{52, 70, 95, 23, 04, 60, 11, 42, 69, 24, 68, 56, 01, 32, 56, 71, 37, 02, 36, 91},
	{22, 31, 16, 71, 51, 67, 63, 89, 41, 92, 36, 54, 22, 40, 40, 28, 66, 33, 13, 80},
	{24, 47, 32, 60, 99, 03, 45, 02, 44, 75, 33, 53, 78, 36, 84, 20, 35, 17, 12, 50},
	{32, 98, 81, 28, 64, 23, 67, 10, 26, 38, 40, 67, 59, 54, 70, 66, 18, 38, 64, 70},
	{67, 26, 20, 68, 02, 62, 12, 20, 95, 63, 94, 39, 63, 08, 40, 91, 66, 49, 94, 21},
	{24, 55, 58, 05, 66, 73, 99, 26, 97, 17, 78, 78, 96, 83, 14, 88, 34, 89, 63, 72},
	{21, 36, 23, 09, 75, 00, 76, 44, 20, 45, 35, 14, 00, 61, 33, 97, 34, 31, 33, 95},
	{78, 17, 53, 28, 22, 75, 31, 67, 15, 94, 03, 80, 04, 62, 16, 14, 09, 53, 56, 92},
	{16, 39, 05, 42, 96, 35, 31, 47, 55, 58, 88, 24, 00, 17, 54, 24, 36, 29, 85, 57},
	{86, 56, 00, 48, 35, 71, 89, 07, 05, 44, 44, 37, 44, 60, 21, 58, 51, 54, 17, 58},
	{19, 80, 81, 68, 05, 94, 47, 69, 28, 73, 92, 13, 86, 52, 17, 77, 04, 89, 55, 40},
	{04, 52, 08, 83, 97, 35, 99, 16, 07, 97, 57, 32, 16, 26, 26, 79, 33, 27, 98, 66},
	{88, 36, 68, 87, 57, 62, 20, 72, 03, 46, 33, 67, 46, 55, 12, 32, 63, 93, 53, 69},
	{04, 42, 16, 73, 38, 25, 39, 11, 24, 94, 72, 18, 08, 46, 29, 32, 40, 62, 76, 36},
	{20, 69, 36, 41, 72, 30, 23, 88, 34, 62, 99, 69, 82, 67, 59, 85, 74, 04, 36, 16},
	{20, 73, 35, 29, 78, 31, 90, 01, 74, 31, 49, 71, 48, 86, 81, 16, 23, 57, 05, 54},
	{01, 70, 54, 71, 83, 51, 54, 69, 16, 92, 33, 48, 61, 43, 52, 01, 89, 19, 67, 48},
}


g_product_of_4_adjascent_nums_in_same_dir :: proc() -> u64 {
	fmt.printfln("%v", BULLSHIT)
	flat := make([dynamic]u8, 0)
	// fmt.println(flat)
	for i := 0; i < len(BULLSHIT); i += 1 {
		for j := 0; j < len(BULLSHIT[i]); j += 1 {
			append(&flat, u8(BULLSHIT[i][j]))
		}
	}
	fmt.println(flat)

	// first try largest adjascent linear
	biggest_horizontal_product: u64 = 0
	k := 0
	for {
		head := k + 4
		if head > len(flat) {
			fmt.printfln("goind out of bounds breaking...")
			break
		}

		nums := flat[k:head]
		fmt.printfln("probing: %v", nums)
		nums_product: u64 = 1
		for n in nums {
			nums_product *= u64(n)
		}

		if biggest_horizontal_product < nums_product {
			biggest_horizontal_product = nums_product
		}
		k += 1
	}

	// now lets do vertical sooo we need to construct a loop in a way that on each i iteration i go column width +

	j := 0
	width := len(BULLSHIT[0])
	biggest_vertical_product: u64

	for col := 0; col < width; col += 1 {
		for row := 0; row + 3 * width + col < len(flat); row += width {
			product: u64 = 1

			for i := 0; i < 4; i += 1 {
				n := flat[row + col + i * width]
				product *= u64(n)
			}

			if product > biggest_vertical_product {
				biggest_vertical_product = product
			}
		}
	}

	// now left diagonal

	height := len(BULLSHIT)

	biggest_left_down_product: u64
	biggest_right_down_product: u64

	for row := 0; row + 3 < height; row += 1 {
		for col := 0; col + 3 < width; col += 1 {
			product: u64 = 1

			for i := 0; i < 4; i += 1 {
				product *= u64(BULLSHIT[row + i][col + i])
			}

			if product > biggest_left_down_product {
				biggest_left_down_product = product
			}
		}
	}

	for row := 0; row + 3 < height; row += 1 {
		for col := 3; col < width; col += 1 {
			product: u64 = 1

			for i := 0; i < 4; i += 1 {
				product *= u64(BULLSHIT[row + i][col - i])
			}
			if product > biggest_right_down_product {
				biggest_right_down_product = product
			}
		}
	}


	return max(biggest_horizontal_product, biggest_vertical_product, biggest_left_down_product, biggest_right_down_product)
}

main :: proc() {
	fmt.printfln("02+30 = %d", 02 + 30) // ok prefix 0 is fine to use
	fmt.printfln(
		"greatest product of adjascent nums in same dir: %d",
		g_product_of_4_adjascent_nums_in_same_dir(),
	)
}
