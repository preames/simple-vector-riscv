

int dotproduct_i32(unsigned len, int* a, int *b) {
  int res = 0;
  for (unsigned i = 0; i < len; i++)
    res += a[i] * b[i];
  return res;
}
