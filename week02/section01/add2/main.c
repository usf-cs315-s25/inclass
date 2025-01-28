#include <stdio.h>

int add2_c(int, int);
int add2_s(int, int);

int main(int argc, char **argv) {
    int a = 1;
    int b = 2;

    int c_result = add2_c(a, b);
    printf("C: %d\n", c_result);

    int s_result = add2_s(a, b);
    printf("Asm: %d\n", s_result);

    return 0;
}
