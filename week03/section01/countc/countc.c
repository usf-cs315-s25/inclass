#include <stdio.h>

int countc_c(char *str, char ch);
int countc_s(char *str, char ch);

int main(int argc, char **argv) {
    char *str = argv[1];
    char ch = argv[2][0];

    int c_count = countc_c(str, ch);
    printf("C: %d\n", c_count);

    int s_count = countc_s(str, ch);
    printf("Asm: %d\n", s_count);

    return 0;
}
