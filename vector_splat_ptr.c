
void vector_splat_ptr(int** a, int* v, unsigned a_len) {
  for (unsigned i = 0; i < a_len; i++)
    a[i] = v;
}
