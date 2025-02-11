#include <stdio.h>
#include <stdlib.h>

int fact_c(int);
int fact_s(int);

int main(int argc, char **argv) {
    int n = atoi(argv[1]);

    int fact = fact_c(n);
    printf("C: %d\n", fact);

    fact = fact_s(n);
    printf("Asm: %d\n", fact);

    return 0;
}
