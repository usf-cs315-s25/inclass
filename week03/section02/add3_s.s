.global add3_s

# a0 = a, a1 = b
# return sum

add2_s:
    add a2, a0, a1
    mv a0, a2
    ret

add3_s:
                            # prologue
    addi sp, sp, -16        # alloc 16 bytes by subtracting from sp
    sd ra, (sp)             # preserve ra on the stack
    sd a2, 8(sp)            # preserve a2
    jal add2_s              # ret val is in a0 (firstTwo)
    ld a2, 8(sp)            # restore a2
    mv a1, a2               # set up c in a1
    jal add2_s              # a0 and a1 contain vals to be added

                            # epilogue
    ld ra, (sp)             # restore ra
    addi sp, sp, 16         # dealloc stack space
    ret
