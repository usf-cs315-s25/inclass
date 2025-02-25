#include <stdint.h>
#include <stdio.h>

int add2_c(int, int);
int add2_s(int, int);

int main(int argc, char **argv) {
    int a = 10;
    int b = 11;

    int c_result = add2_c(a, b);
    printf("C: %d\n", c_result);

    int s_result = add2_s(a, b);
    printf("Asm: %d\n", s_result);

    uint32_t *pcode = (uint32_t *)&add2_s;
    printf("Add instr word: %X\n", *pcode);
    printf("MV instr word: %X\n", *(pcode + 1));
    // boom *pcode = 0x00000000;

    // stack overflow. ra into pc, execute from there
    // char *p;
    // strcpy(p, "foobar");
}
