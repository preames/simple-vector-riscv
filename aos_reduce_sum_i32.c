
struct T {
  long a;
  long b;
  long c;
  long d;
  long e;
  long f;
  int g;
  int h;
};


// Given a array-of-structures memory layout, write to the same field
// in each struct.
int aos_reduce_sum_i32(unsigned len, struct T* a) {
  int sum = 0;
  for (unsigned i = 0; i < len; i++)
    sum += a[i].g;
  return sum;
}
