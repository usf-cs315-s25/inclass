int add2_c(int a, int b) {
    return a + b;
}

int add3_c(int a, int b, int c) {
    int firstTwo = add2_c(a, b);
    int total = add2_c(firstTwo, c);
    return total;
}
