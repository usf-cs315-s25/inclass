#include <stdint.h>

uint32_t get_bitseq_c(uint32_t num, int start, int end) {
    uint32_t val;
    int len;
    uint64_t mask;

    len = (end - start) + 1;
    val = num >> start;

    if (len == 64) {
        mask = 0xFFFFFFFFFFFFFFFF;
    } else {
        mask = (0b1 << len) - 1;
    }

    val = val & mask;

    return val;
}
