.global add3_s

# a0 = a, a1 = b
# return sum

add2_s:
    add a0, a0, a1
    ret

# a0 = a, a1 = b, a2 = c
# return sum

add3_s:
                            # prologue
    addi sp, sp, -8         # alloc 8 bytes on the stack
    sd ra, (sp)             # preserve ra
    
    jal add2_s              # add first two
                            # a0 holds the sum

    mv a1, a2               # set up c as second arg to add2
    jal add2_s
                            # epilogue
    ld ra, (sp)             # restore ra
    addi sp, sp, 8          # dealloc stack space
    ret
