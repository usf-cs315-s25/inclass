int slen_c(char *s) {
    int len = 0;
    while (*s != '\0') {
        len++; // increment count
        s++;   // increment pointer to next char
    }
    return len;
}
