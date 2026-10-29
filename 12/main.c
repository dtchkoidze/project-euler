#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>

#define u64 uint64_t

u64 divisors_count(u64 n) {
    u64 count = 0;

    for (int i = 1; i <= n / i; i++) {
        if (n % i == 0) {
            count += (i == n / i) ? 1 : 2;
        }
    }

    return count;
}

u64 triangle_number_with_over_n_divisors(u64 n) {
    int i = 0;
    u64 tr_number = 0;
    for (;;) {
        tr_number += i;
        // printf("triangle number: %lu, idx: %d\n", tr_number, i);
        if (divisors_count(tr_number) > n) {
            break;
        }
        i+=1;
    }

    return tr_number;
}

int main(void) {
    assert(triangle_number_with_over_n_divisors(5) == 28);
    printf("triangle num with over 500 divisors: %lu\n", triangle_number_with_over_n_divisors(500));
}
