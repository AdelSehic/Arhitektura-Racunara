#include <stdint.h>

int sum_even(int16_t* array, int32_t size){
  int sum = 0;
  for( int32_t i = 0; i < size; ++i){
    if(!(array[i]&1)){
      sum+=array[i];
    }
  }
  return sum;
}
