int fact_c(int n) {

    // base case
    if (n <= 1)
        return 1;

    // recursive case, decompose input n-1
    return n * fact_c(n-1);
}
