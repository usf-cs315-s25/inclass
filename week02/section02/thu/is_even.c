#include <stdio.h>
#include <stdlib.h>

int is_even_c(int);
int is_even_s(int);

int main(int argc, char **argv) {
    if (argc == 1) {
        printf("not enough arguments\n");
        exit(1);
    }
    int a = atoi(argv[1]);

    int c_result = is_even_c(a);
    printf("C: %d\n", c_result);

    int s_result = is_even_s(a);
    printf("Asm: %d\n", s_result);
}
