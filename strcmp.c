

int my_strcmp(char* a, char *b) {
  while (1) {
    if (*a != *b)
      return (*a < *b) ? -1 : 1;
    if (*a == '\0')
      return 0;
    a++;
    b++;
  }
}
