#include "stdio.h"
#include "string.h"

struct person {
  char* name;
}

void say(struct person p, char* s) {
  printf("%s says: %s\n", p.name, s);
}

int main(int argc, char const *argv[]) {
  struct person Alex;
  strcpy(Alex.name, "Alex");

  say(Alex, "Hello World!");
  return 0;
}
