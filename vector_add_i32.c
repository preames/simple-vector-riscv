

void vector_add_i32(int* a, unsigned a_len, int b) {
  for (unsigned i = 0; i < a_len; i++)
    a[i] += b;
}
