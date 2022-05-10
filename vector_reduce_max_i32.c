int vector_reduce_max_i32(int* a, unsigned a_len) {
  int max = -987654321;
  for (unsigned i = 0; i < a_len; i++)
    max = (a[i] > max) ? a[i] : max;
  return max;
}
