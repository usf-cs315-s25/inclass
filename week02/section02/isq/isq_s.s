.global isq_s

# a0 contains a char
# return 0 (false) if it's not 'q' or 1 (true) if it's 'q'

isq_s:
    li t0, 'q'              # t0 = 'q'
    beq a0, t0, equal       # if a0 == t0, go to equal
    li a0, 0                # a0 = 0
    j done                  # jump over equal to done
equal:
    li a0, 1                # a0 = 1
done:
    ret
