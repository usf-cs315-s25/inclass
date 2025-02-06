.global countc_s

# a0 is str, a1 is ch
# returns index of ch in arr, else -1

findc_s:
    li t0, 0                    # t0 is the index
find_loop:
    lb t1, (a0)                 # t1 is *str
    beq t1, zero, find_done     # null terminator?
    beq t1, a1, find_done       # if *str == ch, done
    addi t0, t0, 1              # index++
    addi a0, a0, 1              # str++
    j find_loop 
find_done:
    bne t1, zero, find_ret      # found anything?
    li t0, -1                   # idx = -1
find_ret:
    mv a0, t0                   # set up index ret val
    ret


# a0 is str, a1 is ch
# returns count of ch in arr

countc_s:
    addi sp, sp, -8             # alloc space for 1 reg
    sd ra, (sp)                 # preserve ra
    li t0, 0                    # t0 holds the count
count_loop:
    lb t1, (a0)                 # t1 = *str
    beq t1, zero, count_done    # null terminator?

    addi sp, sp, -16            # make space for caller-pres
    sd a0, (sp)                 # preserve arr
    sd t0, 8(sp)                # preserve count
    jal findc_s
    mv t2, a0                   # t2 = index or -1
    ld a0, (sp)                 # restore arr
    ld t0, 8(sp)                # restore count
    addi sp, sp, 16             # dealloc caller-preserved

    li t3, -1
    beq t3, t2, count_done

    addi t0, t0, 1              # count++
    addi t2, t2, 1              # index + 1
    add a0, a0, t2              # str += index + 1
    j count_loop

count_done:

    mv a0, t0                   # set up count ret val

    ld ra, (sp)                 # restore ra (ra = *sp)
    addi sp, sp, 8              # dealloc stack space
    ret
