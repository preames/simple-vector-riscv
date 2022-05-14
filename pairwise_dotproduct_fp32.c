
// Note: This intentionally does not use any form of -fastmath.
void pairwise_dotproduct_fp32(unsigned len, float *a, float* b, float *c) {
  for (unsigned i = 0; i < 2*(len/2); i += 2)
    a[i/2] = (b[i] * c[i]) + (b[i+1] * c[i+1]);
}
