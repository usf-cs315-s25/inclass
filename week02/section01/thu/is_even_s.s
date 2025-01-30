.global is_even_s

# a0 contains an integer
# returns 1 if the arg is even, or 0 if the arg is odd
is_even_s:
    li t0, 1                # load 1 to test for even/odd
    and a0, a0, t0          # bitwise AND arg with 1
    bne a0, zero, odd       # if result is not zero, it's odd
    li a0, 1                # set up true in a0
    j done                  # jump over the else case
odd:
    li a0, 0                # set up false in a0
done:
    ret
