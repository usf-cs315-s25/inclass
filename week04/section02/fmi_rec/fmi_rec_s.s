.global fmi_rec_s

/*
    a0 is the arr
    a1 is the len
    a2 is the idx to start from
    a3 is the idx of the max elem
    returns idx of max elem
 */
 
fmi_rec_s:
    addi sp, sp, -8
    sd ra, (sp)
    
    mv t0, a3           # t0 is max_new
    blt a1, a2, ret_max # walked off the array?

    slli t1, a2, 2      # t1 is offset of idx'th elem
    add t1, a0, t1      # t1 is &arr[idx]
    lw t1, (t1)         # t1 is arr[idx]

    slli t2, a3, 2      # t2 is offset of max'th elem
    add t2, a0, t2      # t2 is &arr[max_idx]
    lw t2, (t2)         # t2 is arr[max_idx]

    bge t2, t1, nomax   # new max?
    mv t0, a2           # new_max = idx
nomax:
    addi a2, a2, 1      # set up idx + 1
    mv a3, t0           # set up max_new in a3
    jal fmi_rec_s
    j done
ret_max:
    mv a0, a3           # set up max_idx
done:
    ld ra, (sp)
    addi sp, sp, 8
    ret
