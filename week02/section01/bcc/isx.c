#include <stdbool.h>
#include <stdio.h>

bool isx_c(char);
bool isx_s(char);

int main(int argc, char **) {
    char ch = 'x';
    bool c_result = isx_c(ch);
    printf("C: %b\n", c_result);

    bool s_result = isx_s(ch);
    printf("Asm: %b\n", s_result);
}
