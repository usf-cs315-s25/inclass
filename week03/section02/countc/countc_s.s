.global countc_s


findc_s:
    li t0, 0                # t0 is the index
find_loop:
    lb t1, (a0)             # t1 = *str
    beq t1, zero, find_done # reached null term?
    beq t1, a1, find_done   # found ch
    addi t0, t0, 1           # index++
    addi a0, a0, 1          # str++
    j find_loop
find_done:

    bne t1, zero, find_ret
    li t0, -1
find_ret:
    mv a0, t0               # set up index as ret val
    ret

    
countc_s:
    addi sp, sp, -8         # alloc space to preserve ra
    sd ra, (sp)             # preserve ra
    li t0, 0                # t0 is the count

count_loop:
    lb t1, (a0)             # t1 = *str
    beq zero, t1, count_done

    addi sp, sp, -16         # alloc space for caller-pres
    sd a0, (sp)             # preserve str
    sd t0, 8(sp)            # preserve count
    jal findc_s
    mv t2, a0               # save ret val
    ld a0, (sp)             # restore str
    ld t0, 8(sp)            # restore count
    addi sp, sp, 16         # dealloc caller-preserved

    li t3, -1               # set up cond branch
    beq t2, t3, count_done  # ret val == -1?
    addi t0, t0, 1          # count++
    addi t2, t2, 1          # index + 1
    add a0, a0, t2          # str += index+1
    
    j count_loop
count_done:

    ld ra, (sp)             # restore ra
    addi sp, sp, 8          # dealloc stack space
    
    mv a0, t0               # set up ret val
    ret
