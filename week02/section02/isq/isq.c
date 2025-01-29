#include <stdbool.h>
#include <stdio.h>

bool isq_c(char);
bool isq_s(char);

int main(int argc, char **argv) {
    char ch = 'q';

    bool c_result = isq_c(ch);
    printf("C: %b\n", c_result);

    bool s_result = isq_s(ch);
    printf("Asm: %b\n", s_result);
}
