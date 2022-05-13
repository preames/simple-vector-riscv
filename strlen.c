

int my_strlne(char* s) {
  char *p = s;
  while (*s != '\0')
    s++;
  return s-p;
}
