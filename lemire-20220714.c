//source: https://lemire.me/blog/2022/07/14/filtering-numbers-faster-with-sve-on-amazon-graviton-3-processors/
typedef long int64_t;
typedef int int32_t;
void remove_negatives_scalar(const int32_t * __restrict input, 
        int64_t count, int32_t * __restrict output) {
  int64_t i = 0;
  int64_t j = 0;
  for(; i < count; i++) {
    if(input[i] >= 0) {
      output[j++] = input[i];
    }
  }
}
