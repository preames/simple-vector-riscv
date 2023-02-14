
void test(long *c, int *a, int *b, int len) {
  for (int i = 0; i < len; i++) {
    c[i] += (long)a[i] + (long)b[i];
  }
}
