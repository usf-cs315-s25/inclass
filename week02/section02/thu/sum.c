#include <stdio.h>
#include <stdlib.h>

int sum_c(int);
int sum_s(int);

int main(int argc, char **argv) {
    if (argc == 1) {
        printf("not enough arguments\n");
        exit(1);
    }
    int a = atoi(argv[1]);

    int c_result = sum_c(a);
    printf("C: %d\n", c_result);

    int s_result = sum_s(a);
    printf("Asm: %d\n", s_result);
}
