// Taken from Performance Left on the Table: An Evaluation of Compiler
// Vectorization for RISC-V
// Note that we don't vectorize this with fixed vectors either, so this
// more a gap in the vectorizer in general, than a specific gap around
// scalable vectors.
void vector_overlap(int*  __restrict a, int*  __restrict b, unsigned N) {
  for (int i = 1; i < N; i++) {
    b[i] = a[i-1] + a[i] + a[i+1];
  }
}
