int sumarr_c(int *a, int len) {
    int sum = 0;
    for (int i = 0; i < len; i++) {
        int x = *a;
        sum += x;
        a++;
    }
    return sum;
}
