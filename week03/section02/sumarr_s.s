.global sumarr_s

# a0 is a pointer to an array of int (4-bytes each)
# a1 is the length
sumarr_s:
    li t0, 0            # t0 is the sum
    li t2, 0            # t2 is the loop index variable
loop:
    beq t2, a1, done    # if i == len, break the loop
    lw t1, (a0)         # t1 = *arr
    add t0, t0, t1      # sum += *arr
    addi a0, a0, 4      # walk arr to the next 4-byte integer
    addi t2, t2, 1      # i++
    j loop
done:
    mv a0, t0           # set up sum ret val
    ret
