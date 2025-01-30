.global sum_s

sum_s:
    li t0, 0            # t0 is the sum
loop:
    beq a0, zero, done  # if a0 == 0, done
    add t0, t0, a0      # t0 += a0
    addi a0, a0, -1     # a0 -= 1
    j loop
done:
    mv a0, t0           # set up t0 as ret val
    ret
