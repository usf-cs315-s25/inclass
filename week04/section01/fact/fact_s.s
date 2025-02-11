.global fact_s

# a0 contains n
# returns factorial

fact_s:
    li t0, 1
    bgt t0, a0, base

    addi sp, sp, -16    # alloc space
    sd ra, (sp)         # *sp = ra
    sd a0, 8(sp)        # preserve n
    addi a0, a0, -1     # setup n-1
    jal fact_s          # recurse
    ld a1, 8(sp)        # restore n
    mul a0, a0, a1      # n * ret val
    ld ra, (sp)         # ra = *sp
    addi sp, sp, 16     # dealloc space
    j done
base:
    li a0, 1
done:
    ret
