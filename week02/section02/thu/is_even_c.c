int is_even_c(int a) {
    // return !(a & 1);

    if ((a & 1) == 0) {
        return 1; // even
    } else {
        return 0; // odd
    }
}
