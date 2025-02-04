.global sumarr_s

# a0 is a pointer to a C int
# a1 is the len of the array

sumarr_s:
    li t0, 0            # t0 is the sum
    li t1, 0            # t1 is the loop index (i)
loop:
    beq t1, a1, done    # reached len elems
    lw t2, (a0)         # t2 = *arr
    add t0, t0, t2      # t0 += t2
    addi t1, t1, 1      # i++
    addi a0, a0, 4      # walk a0 to the next 4-byte int
    j loop
done:
    mv a0, t0           # set up sum ret val
    ret
