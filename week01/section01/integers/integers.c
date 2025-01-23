#include <stdio.h>

int main(int argc, char **argv) {
    int i = 10;
    printf("i: %d, size: %ld\n", i, sizeof(i));

    long j = 0x000000000000000B;
    printf("j: %ld, size: %ld\n", j, sizeof(j));

    char *s = "0x000000000000000B";
    printf("s: %s", s);
}
