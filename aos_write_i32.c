
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
void aos_init_i32(unsigned len, struct T* a) {
  for (unsigned i = 0; i < len; i++)
    a[i].g = 0;
}
