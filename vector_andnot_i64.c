

void vector_andnot_i64(long* a, long *b, unsigned a_len) {
  for (unsigned i = 0; i < a_len; i++)
    a[i] = a[i] & ~b[i];
}
