#include "stdio.h"
#include "string.h"
#include "stdlib.h"

struct person {
  char* name;
};

int say(struct person p, char* s) {
  printf("%s says: %s\n", p.name, s);
  return 0;
}

int main(int argc, char const *argv[]) {
  struct person Alex;
  char* name = "Alex";
  Alex.name = name;
  return say(Alex, "Hello World!");
}
