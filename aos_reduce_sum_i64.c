
struct T {
  long a;
  long b;
  long c;
  long d;
  long e;
  long f;
  long g;
};


// Given a array-of-structures memory layout, write to the same field
// in each struct.
int aos_reduce_sum_i64(unsigned len, struct T* a) {
  long sum = 0;
  for (unsigned i = 0; i < len; i++)
    sum += a[i].g;
  return sum;
}
