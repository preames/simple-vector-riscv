

void my_memcpy(unsigned len, char* a, char* b) {
  for (unsigned i = 0; i < len; i++)
    a[i] = b[i];
}
