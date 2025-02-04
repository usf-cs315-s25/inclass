#include <stdio.h>

int sumarr_c(int *, int);
int sumarr_s(int *, int);

int main(int argc, char **argv) {
    int arr[4] = {1, 2, 3, 4};

    int c_result = sumarr_c(arr, 4);
    printf("C: %d\n", c_result);

    int s_result = sumarr_s(arr, 4);
    printf("Asm: %d\n", s_result);
}
