.global get_bitseq_s

# a0 = num, a1 = start, a2 = end
get_bitseq_s:

    sub t0, a2, a1          # t0 is end - start
    addi t0, t0, 1          # t0 is len

    srl t1, a0, a1          # t1 is val (num >> start)

    li t3, 64
    bne t0, t3, calc_mask   # if len != 64
    li t2, 0xFFFFFFFFFFFFFFFF
    j apply_mask
calc_mask:
    li t2, 1                # t2 = 1 to shift
    sll t2, t2, t0          # t2 = 1 << len
    addi t2, t2, -1         # t2 is the mask

apply_mask:
    and a0, t1, t2      # apply mask to ret val
    ret
