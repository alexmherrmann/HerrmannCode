#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int countUp();

int main (void) {
    int run = 1;
    while(run == 1) {
        int input = 0;
        printf("Make a selection.\n1.Run count up\n2.Exit\n");
        scanf("%i", &input);
        if(input == 1) {
            countUp();
        } else {
          return 0;
        }
    };
    return 0;
}

int countUp() {
    int run = 0;
    int input1 = 0;
    printf("Goal Number: \n");
    scanf("%i", &input1);
    while(run != input1) {
        run++;
        printf("%i\n", run);
    };
    return 0;
}
