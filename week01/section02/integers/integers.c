#include <stdio.h>

int main(int argc, char **argv) {
    int i = 10;
    printf("i: %d, size: %ld\n", i, sizeof(i));

    long j = 11;
    printf("j: %ld, size: %ld\n", j, sizeof(j));

    char *s = "0x0000000A";
    printf("s: %s\n", s);
}
