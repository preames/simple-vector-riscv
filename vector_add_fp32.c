

void vector_add_i32(float* a, unsigned a_len, float b) {
  for (unsigned i = 0; i < a_len; i++)
    a[i] += b;
}
