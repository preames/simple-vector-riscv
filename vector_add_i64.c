

void vector_add_i64(long* a, unsigned a_len, long b) {
  for (unsigned i = 0; i < a_len; i++)
    a[i] += b;
}
