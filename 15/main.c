#include <assert.h>
#include <stdint.h>
#include <stdio.h>

uint64_t factorial(uint64_t n) {
    uint64_t fact = 1;
    for (int i = 1; i <= n; i++) {
        fact *= i;
    }
    return fact;
}

uint64_t max_combinations_on_grid_of_n_x_n(uint64_t n) {
  // uint64_t max_combs = 0;
  // for (int i = 0; i < n; i++) {
  //   int max_right = n - i;
  //   printf("on col: %d, max_right_movs is: %d\n", i, max_right);
  //   max_combs += max_right * n;
  // }
  // return max_combs;

  // ok bullshit n choose k
  // n = 2*n;
  // uint64_t k = n/2;

  // doesnt fit
  // return factorial(n) / (factorial(k) * factorial(n-k));

  uint64_t result = 1;
  for (uint64_t i = 1; i <= n; i++) {
    result = result * (n + i) / i;
  }

  return result;
}

int main(void) {
    assert(factorial(3) == 6);
    printf("max combos for 2x2 grid: %lu\n", max_combinations_on_grid_of_n_x_n(2));
    printf("max combos for 3x3 grid: %lu\n", max_combinations_on_grid_of_n_x_n(3));
    printf("max combos for 20x20 grid: %lu\n", max_combinations_on_grid_of_n_x_n(20));
}
