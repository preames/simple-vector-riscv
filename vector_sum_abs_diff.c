
typedef signed char int8_t;

// Signed subtract which is not UB on overflow
int8_t sub(int8_t a, int8_t b) {
  return (int8_t)((int)a - (int)b);
}

int8_t myabs(int8_t c) {
  // Note: Assumes C != INT_MIN
  return (c < 0) ? sub(0,c) : c;
}

void vector_sum_abs_diff(int *c, int8_t* a, int8_t* b, unsigned N) {
  for (unsigned i = 0; i < N/8; i++) {
    int accum = 0;
    for (unsigned j = 0; j < 8; j++) {
      unsigned idx = i * 8 + j;
      accum += myabs(a[idx] - b[idx]);
    }
    c[i] = accum;
  }
}
