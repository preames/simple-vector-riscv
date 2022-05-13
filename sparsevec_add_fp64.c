
// Sparse Vector Representation:
// - dense index array maps vector indices to offsets in storage
// - point here is just to get a mix of scatter and gathers
void sparsevec_add_i32(unsigned len, double* a, int *aidx,
                       double *b, int *bidx) {
  for (unsigned i = 0; i < len; i++)
    a[aidx[i]] += b[bidx[i]];
}
