
// Note: This intentionally does not use any form of -fastmath.
float dotproduct_fp32(unsigned len, float* a, float *b) {
  float res = 0.0;
  for (unsigned i = 0; i < len; i++)
    res += a[i] * b[i];
  return res;
}
