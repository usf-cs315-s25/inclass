.global slen_s

# a0 contains the addr of a C string
# return length of string

slen_s:
    li t0, 0            # t0 is the length
loop:
    lb t1, (a0)         # t1 = *s
    beq t1, zero, done  # have we encountered the null terminator?
    addi t0, t0, 1      # len++
    addi a0, a0, 1      # s++
    j loop
done:
    mv a0, t0           # setup length ret val
    ret
