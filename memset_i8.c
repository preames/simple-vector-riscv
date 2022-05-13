

void my_memset(char* a, unsigned a_len, char b) {
  for (unsigned i = 0; i < a_len; i++)
    a[i] = b;
}
