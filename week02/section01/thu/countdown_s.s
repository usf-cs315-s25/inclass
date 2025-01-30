.global countdown_s

# a0 number of loop iterations
# returns 0

# All assembly loops are a conditional branch to exit
# and an unconditional branch to continue the loop

countdown_s:
loop:
    beq a0, zero, done      # if a0 == 0, go to done
    addi a0, a0, -1         # decrement a0 using addi and a negative immediate
    j loop
done:
    ret
