#include <stdio.h>

int myglobal = 0;

int foo() {
    return 0;
}

int main(int argc, char **argv) {
    int *pglobal = &myglobal;
    printf("pglobal: %p\n", pglobal);

    int (*pfoo)();
    pfoo = &foo;
    printf("&foo: %p\n", pfoo);
}
