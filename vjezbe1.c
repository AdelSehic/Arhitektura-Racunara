// ne postoji mips instrukcija za direktno loadanje u registar, moramo "hakovat" sa add
// ELF == .exe
//
#include <stdio.h>

int max( const int* a, const int b){
  int k = *a;

  for(int i = 1; i < b; i++){
    if(a[1+i]>k) k = a[1+i];
  }

  return k;
}

int main(){

  const int size = 9;
  int array[9]={5,3,87,12,100,23,3,5,9};
  int m = max(array, size);
  printf("Najveci element je: %u\n", m);

  return 0;
}
