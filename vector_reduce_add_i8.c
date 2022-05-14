

int vector_reduce_add_i32(char* a, unsigned a_len) {
  int sum = 0;
  for (unsigned i = 0; i < a_len; i++)
    sum += a[i];
  return sum;
}
