
typedef signed char int8_t;

// Signed subtract which is not UB on overflow
int8_t sub(int8_t a, int8_t b) {
  return (int8_t)((int)a - (int)b);
}

int8_t myabs(int8_t c) {
  // Note: Assumes C != INT_MIN
  return (c < 0) ? sub(0,c) : c;
}

void vector_abs_diff(int8_t *c, int8_t* a, int8_t* b, unsigned N) {
  for (unsigned i = 0; i < N; i++) {
    c[i] = myabs(sub(a[i], b[i]));
  }
}
