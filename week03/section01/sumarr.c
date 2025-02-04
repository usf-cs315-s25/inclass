#include <stdio.h>

int sumarr_c(int *, int);
int sumarr_s(int *, int);

int main(int argc, char **argv) {
    int arr[5] = {1, 2, 3, 4, 5};

    int c_result = sumarr_c(arr, 5);
    printf("C: %d\n", c_result);

    int s_result = sumarr_s(arr, 5);
    printf("Asm: %d\n", s_result);
}
