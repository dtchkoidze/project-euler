#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

int main(void) {
    double bullshit = pow(2, 1000);
    // printf("%.0f\n", bullshit);
    char str[1000];
    snprintf(str, sizeof(str), "%0.f", bullshit);
    printf("str: %s", str);
    uint64_t sum = 0;
    for (int i = 0; i < strlen(str) / sizeof(char); i++) {
        uint64_t converted = str[i] - '0';
        sum += converted;
    }

    printf("sum: %lu\n", sum);
}
