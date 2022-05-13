

int my_strnlne(unsigned len, char* s) {
  for (unsigned i = 0; i < len; i++)
    if (s[i] == '\0')
      return i;
  return len;
}
