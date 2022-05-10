

int vector_add_reduce_i32(int* a, unsigned a_len) {
  int sum = 0;
  for (unsigned i = 0; i < a_len; i++)
    sum += a[i];
  return sum;
}
