#include <stdio.h>

int slen_c(char *);
int slen_s(char *);

int main(int argc, char **argv) {
    if (argc == 1) {
        printf("invalid arguments\n");
        return -1;
    }

    char *s = argv[1];
    int c_result = slen_c(s);
    printf("C: %d\n", c_result);

    int s_result = slen_s(s);
    printf("Asm: %d\n", s_result);
}
