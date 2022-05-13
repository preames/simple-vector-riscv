
// Sparse Vector Representation:
// - dense index array maps vector indices to offsets in storage
// - point here is just to get a mix of scatter and gathers
void sparsevec_add_i32(unsigned len, int* a, short *aidx, int *b, short *bidx) {
  for (unsigned i = 0; i < len; i++)
    a[aidx[i]] += b[bidx[i]];
}
