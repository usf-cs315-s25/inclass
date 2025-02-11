#include <stdio.h>
#include <stdlib.h>

int myglobal = 0; // a global variable

int foo() {
    myglobal = 1;
}

int main(int argc, char **argv) {
    printf("&myglobal: %p\n", &myglobal);

    printf("&foo: %p\n", &foo);

    int j = 2; // local variable on the stack
    printf("&j: %p\n", &j);

    char *heapobj = (char *)malloc(2 * sizeof(char));
    printf("heapobj: %p\n", &heapobj); // stack-based pointer

    // heapobj itself is on the heap
}
