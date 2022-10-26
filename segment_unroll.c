#define UNROLL_M 16
#define UNROLL_N 4

void test(float const* restrict A, float const* restrict B, float* restrict C )
{
    for(int ki = 0; ki < UNROLL_N; ki++) {
        for(int kj = 0; kj < UNROLL_M; kj++) {
            C[ki*UNROLL_M+kj] += A[kj] * B[ki];
        }
    }
}
