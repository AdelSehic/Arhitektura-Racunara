#include <stdio.h>

//int to_binary(char* a, int b){
// int iterations = 0;
// for(int i = 31; b; --i, ++iterations){
//   int temp = b & 1;
//   a[i] = temp+'0';
//   b >>= 1;
// }
// return iterations;
// }
int to_binary(char*, int);

int main(){
  
  char buffer[33]={};
  for(int i = 0; i < 32; ++i){
    buffer[i] = '0';
  }
  buffer[32] = '\0';

  int k = to_binary(buffer, 255);

  printf("iterations:%d\n%s\n", k, buffer);

  return 0;
}
