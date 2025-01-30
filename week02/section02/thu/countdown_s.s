.global countdown_s

countdown_s:
loop:
    beq a0, zero, done  # if == 0, done
    addi a0, a0, -1     # decrement a0
    j loop
done:
    ret
