.global fmi_rec_s

fmi_rec_s:
    addi sp, sp, -8
    sd ra, (sp)     # preserve ra
    
    mv t0, a3       # t0 is max_new

    blt a1, a2, ret_max     # idx >= len

    slli t1, a2, 2  # offset of idx'th elem
    add t2, a0, t1  # t2 is &arr[idx] 
    lw t2, (t2)     # t2 is arr[idx]

    slli t3, a3, 2  # offset of max'th elem
    add t3, a0, t3  # t3 is &arr[max_idx]
    lw t3, (t3)     # t3 is arr[max_idx]

    bge t3, t2, not_max
    mv t0, a2       # max_new = idx
    
not_max:

    addi a2, a2, 1  # set up idx + 1 in a2
    jal fmi_rec_s
    j done
ret_max:
    mv a0, a3       # set up max_idx

done:
    ld ra, (sp)     # restore ra
    addi sp, sp, 8
    
    ret
