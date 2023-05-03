#include <stdint.h>

void combinations(char*, uint32_t, uint32_t);

int main(int argc, char const *argv[]) {
  char set[] = {'a', 'b', 'd', 'e'};
  combinations(set, 4, 2);
  return 0;
}