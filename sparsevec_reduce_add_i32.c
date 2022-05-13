
// Sparse Vector Representation:
// - dense index array maps vector indices to offsets in storage
int sparsevec_reduce_add_i32(unsigned len, int* a, short *aidx) {
  int res = 0;
  for (unsigned i = 0; i < len; i++)
    res += a[aidx[i]];
  return res;
}
