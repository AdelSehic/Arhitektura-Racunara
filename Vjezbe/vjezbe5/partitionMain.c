#include <stdio.h>

void partition(int* arr, int size, int (*predicate)(int));

int isEven(int a){
  return !(a & 1);
}

int main(void)
{
  int array[] = {7, 4,2,1,3,3,5,8,12,13};

  partition(array, 10, isEven);
  int i;
  for (i = 0; i < 10; i++){
    printf("%d", array[i] );
  }
  printf("\n");

  return 0;
}
