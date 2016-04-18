#include <stdio.h>
#include <stdlib.h>

void loadCount(int to) {
  if (to <= 0) {
    return;
  }

  for(int i = 0; i < to; i++) {
    printf("%d\n", i);
  }
}

int main(int argc, char** argv) {
  if(argc != 2) {
    puts("Need exactly one argument!");
    return 2;
  }

  // calling our function
  int inputted = 0;
  int rval = sscanf(argv[1], "%d", &inputted);
  if(rval<=0) {
    printf("couldn't parse \"%s\" as a number\n", argv[1]);
    return 1;
  }
  loadCount(inputted);

  puts("done");
}
