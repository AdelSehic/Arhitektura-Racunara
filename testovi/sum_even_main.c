#include <stdio.h>
#include <stdint.h>

int sum_even(int16_t*, int32_t);

int16_t array[]={11,1,7,332,100,50};

int main(){

  int result = sum_even(array, 6);
  printf("Even numbers: %d\n", result);

  return 0;
}
