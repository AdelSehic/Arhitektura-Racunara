static void part_impl(int* f, int* s, int (*pred)(int)){
  if(f==s) return;
  if( pred(*f)){
    int t = *f;
    *f = *s;
    *s = t;
    --s;
  } else {
    ++f;
  }
  part_impl(f,s,pred);
}

void partition(int* arr, int size, int (*pred)(int)){
  if(size<2) return;
  part_impl(arr,arr+size-1,pred);
}


