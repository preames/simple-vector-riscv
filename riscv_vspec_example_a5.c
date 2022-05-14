
// Taken from psuedo code of example from riscv vector spec non-normative
// example section.
void saxpy(long n, const float a, const float *x, float *y) {
  long i;
  for (i=0; i<n; i++)
    y[i] = a * x[i] + y[i];
}
