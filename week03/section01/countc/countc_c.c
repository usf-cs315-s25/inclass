/* findc_c walks str
   if ch occurs in str, return the index
   if not, return -1;
*/
int findc_c(char *str, char ch) {
    int index = 0;
    while (*str) {
        if (*str == ch) {
            // found the desired char, break the loop
            break;
        } else {
            // didn't find desired char, keep going
            index++;
            str++;
        }
    }

    if (!*str) {
        // reached '\0' before finding ch
        index = -1;
    }

    return index;
}

/* countc_c counts occurrences of ch in str
   by calling findc_c in a loop
*/
int countc_c(char *str, char ch) {
    int count = 0;
    while (*str) {
        int index = findc_c(str, ch);
        if (index != -1) {
            // found one, increment count, walk str forward
            count++;
            str += index + 1;
        } else {
            // didn't find one, break loop, count is what it is
            break;
        }
    }
    return count;
}
