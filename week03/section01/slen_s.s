.global slen_s

# a0 = pointer to chars
# return its length before null terminator

slen_s:
    li t1, 0            # t1 is the length
loop:
    lb t0, (a0)         # t0 = *s
    beq t0, zero, done  # reached null terminator?
    addi a0, a0, 1      # walk a0 to point to the next char
    addi t1, t1, 1      # increment length
    j loop              # go again
done:
    mv a0, t1           # set up length ret val in a0
    ret
