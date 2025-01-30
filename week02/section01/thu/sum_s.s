.global sum_s

sum_s:
    li t0, 0                # t0 is the sum
loop:
    add t0, t0, a0          # accumulate sum
    addi a0, a0, -1         # decrement a0
    bge a0, zero, loop
done:
    mv a0, t0               # set up ret val
    ret
