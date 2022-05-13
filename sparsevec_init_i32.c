
// Sparse Vector Representation:
// - dense index array maps vector indices to offsets in storage
void sparsevec_init_i32(unsigned len, int* a, short *aidx) {
  for (unsigned i = 0; i < len; i++)
    a[aidx[i]] = i;
}
