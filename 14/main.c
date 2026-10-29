#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define u64 uint64_t

// memoization can also be done but js kids can do it, this shi runs okish anyway
u64 n_with_longest_collatz_chain_under_n(u64 n) {
    u64 longest_chain_n = 0;
    u64 longest_chain_len = 0;

    // before:
    // for (int i = 2; i < n; i++) {
    // after:
    for (int i = n/2; i < n; i++) {
        // can start at half because any num*2 will be 1 chain more than num, eg, chain for 20 is
        // 20 -> 10 -> 5 -> 16 -> 8 -> 4...
        // wheares for 40 its: 40 -> 20 -> and basically 1 term + collatz(20) so fuck that first half
        u64 sn = i;
        // printf("starting number: %d\n", i);
        u64 chain_len = 1;
        while (sn != 1) {
            {//this is actuall function def
                if ((sn &  1) == 0) {
                    sn /= 2;
                    chain_len += 1;
                } else {
                    // here because we kno that sn*3 + 1 will always be even (odd * odd = odd + 1 = even)
                    // we can skip 1 iteration and +=2
                    sn = (sn*3 + 1) / 2;
                    chain_len += 2;
                }
            }
            // printf("%lu\n", sn);
            // chain_len++;
        }
        // printf("i: %d, chain len: %lu\n", i, chain_len);
        // printf("starting number: %d\n", i);
        if (chain_len > longest_chain_len) {
            longest_chain_len = chain_len;
            longest_chain_n = i;
        }
    }

    return longest_chain_n;
}



int main(void) {
    // printf("longest chain num under 10 is: %lu\n", n_with_longest_collatz_chain_under_n(10));
    printf("longest chain num under 1_000_000 is: %lu\n", n_with_longest_collatz_chain_under_n(1000000));
    exit(EXIT_SUCCESS);
}
