.global fact_s

fact_s:
    addi sp, sp, -16
    sd ra, (sp)         # preserve ra

    li t0, 1
    bgt t0, a0, base

    sd a0, 8(sp)    # preserve n
    addi a0, a0, -1 # set up n-1 for recursion
    jal fact_s

    ld a1, 8(sp)    # restore n
    mul a0, a0, a1  # n*fact_s(-1)
    j done
base:
    li a0, 1        # return 1 for base case
done:
    ld ra, (sp)     # restore ra
    addi sp, sp, 16 # dealloc stack space
    ret
