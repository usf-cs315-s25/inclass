.global countc_s

countc_s:
    addi sp, sp, -16
    sd ra, (sp)

    lb t0, (a0)         # t0 = *s
    beq t0, zero, base  # null term?

    sd t0, 8(sp)        # preserve *s
    addi a0, a0, 1      # set up s+1
    jal countc_s

    ld t0, 8(sp)        # restore *s
    bne t0, a1, done    # if *s == c
    addi a0, a0, 1      # new_count++
    j done
base:
    mv a0, zero     # set up zero ret val

done:
    ld ra, (sp)
    addi sp, sp, 16
    ret
