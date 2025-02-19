#include <stdio.h>

struct foo {
    char c1;
    char c2;
    int i1;
};

int main(int argc, char **argv) {
    struct foo f;

    f.c1 = 'a';
    f.c2 = 'b';
    f.i1 = 42;

    printf("&c1: %p\n", &f.c1);
    printf("&c2: %p\n", &f.c2);
    printf("&i1: %p\n", &f.i1);

    printf("sizeof foo: %ld\n", sizeof(f));
}
