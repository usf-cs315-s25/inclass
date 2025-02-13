.global countc_s

# a0 is the string
# a1 is the char we're counting
# returns count

countc_s:
    addi sp, sp, -24    # alloc stack space
    sd ra, (sp)         # preserve ra

    lb t0, (a0)         # t0 = *s
    beq t0, zero, base  # *s == '\0'? 
    sd t0, 8(sp)        # preserve *s
    sd a1, 16(sp)       # preserve c
    addi a0, a0, 1      # set up s+1 for recursion
    jal countc_s

    ld t0, 8(sp)        # restore *s
    ld a1, 16(sp)       # restore c
    bne t0, a1, done    # *s == c?
    addi a0, a0, 1      # new_count++
    j done
base:
    mv a0, zero         # return 0

done:
    ld ra, (sp)         # restore ra
    addi sp, sp, 24     # dealloc stack space
    ret
