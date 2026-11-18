#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include <threads.h>
#include <inttypes.h>

const int l20[] = {
    4, //zero
    3, //one
    3, //two
    5,//three
    4,// four
    4,// five
    3,// six
    5,// seven
    5,// eight
    4,// nine
    3,// ten
    6,// eleven
    6,// twelve
    8,// thirteen
    8, // fourteen
    7, // fifteen
    7, // sixteen
    9, // seventeen
    8, // eighteen
    8, // nineteen
    6//twenty
};

const int t[] = {
    0, // unused
    0, // ten, in l20[]
    6, // twenty
    6, // thirty
    5, // forty
    5, // fifty
    5, // sixty
    7, // seventy
    6, // eighty
    6, // ninety
};

// for hundreds use l20 map + 7("hundred")
// for thousands use l20 map + 8("thousand")
#define HUNDRED_LETTER_N 7
#define THOUSAND_LETTER_N 8
#define AND_LETTER_N 3

int char_count_of(int n) {
    assert(n <= 1000);
    if (n == 1000) {
        return l20[1] + THOUSAND_LETTER_N;
    }
    int total_cost = 0;
    char nstr[4];
    int len = snprintf(nstr, sizeof nstr, "%d", n);
    int should_add_and = 0;
    if (len == 1) {
        int chint = nstr[0] - '0';
        return l20[chint];
    }

    if (len == 2) {
        if (n >= sizeof(l20) / sizeof(int)) {
            char ltstr[3];
            snprintf(ltstr, 3, "%d", n);
            printf("ltstr: %s\n", ltstr);
            char l = ltstr[0];
            char r = ltstr[1];
            int lint = l - '0';
            int rint = r - '0';

            printf("adding %d to total cost \n", t[lint] + (rint == 0 ? 0 : l20[rint]));
            total_cost += t[lint] + (rint == 0 ? 0 : l20[rint]);
        } else {
            total_cost += l20[n];
        }
    }

    if (len == 3) {
        int h = nstr[0] - '0';
        int last_two = n % 100;
        printf("last two: %d\n", last_two);
        if (last_two > 0) {
            should_add_and = 1;
        }

        if (last_two == 0) {
            goto hunna;
        }
        if (last_two >= sizeof(l20) / sizeof(int)) {
            printf("its more than 20\n");
            char ltstr[3];
            snprintf(ltstr, 3, "%d", last_two);
            printf("ltstr: %s\n", ltstr);
            char l = ltstr[0];
            char r = ltstr[1];
            int lint = l - '0';
            int rint = r - '0';

            printf("adding %d to total cost \n", t[lint] + (rint == 0 ? 0 : l20[rint]));
            total_cost += t[lint] + (rint == 0 ? 0 : l20[rint]);
        } else {
            total_cost += l20[last_two];
        }

    hunna:
        total_cost += l20[h] + HUNDRED_LETTER_N;
    }


    if (should_add_and) {
        total_cost += AND_LETTER_N;
    }


    fin:
    printf("char count of %d is %d\n", n, total_cost);
    return total_cost;
}


uint64_t sum_of_letter_ns_below(int n) {
    uint64_t sum = 0;
    for (int i = 1; i <= n; i++) {
        sum += (uint64_t)char_count_of(i);
    }
    return sum;
}


int main(void) {
    printf("count of 3=%d\n", char_count_of(3));
    printf("count of 333=%d\n", char_count_of(333));
    printf("count of 315=%d\n", char_count_of(315));
    printf("count of 12=%d\n", char_count_of(12));
    printf("sum_of_letter_ns_below below 1000: %" PRIu64 "\n", sum_of_letter_ns_below(1000));
    return 0;
}
