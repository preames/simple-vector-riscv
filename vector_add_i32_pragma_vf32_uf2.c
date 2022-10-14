void vector_add_i32(int* a, unsigned a_len, int b) {
  // This is a test, not an example of a well tuned configuration.
  #pragma clang loop vectorize(enable)
  #pragma clang loop interleave(enable)
  #pragma clang loop vectorize_width(32, scalable)
  #pragma clang loop interleave_count(2)
  for (unsigned i = 0; i < a_len; i++)
    a[i] += b;
}
