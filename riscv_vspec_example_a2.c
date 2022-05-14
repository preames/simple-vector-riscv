
// Taken from psuedo code of example from riscv vector spec non-normative
// example section.
// FIXME: aliasing problem
void example_a2(char* a, char *b, char *c, unsigned n) {
  for (unsigned i=0; i<n; i++) {
    b[i] = (a[i] < 5) ? c[i] : 1;
  }
}
