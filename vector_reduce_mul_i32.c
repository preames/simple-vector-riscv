

int vector_reduce_mul_i32(int* a, unsigned a_len) {
  int product = 1;
  for (unsigned i = 0; i < a_len; i++)
    product *= a[i];
  return product;
}
