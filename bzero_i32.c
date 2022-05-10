

void my_bzero(int* a, unsigned a_len) {
  for (unsigned i = 0; i < a_len; i++)
    a[i] = 0;
}
