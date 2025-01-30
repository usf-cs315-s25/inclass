.global is_even_s

# a0 contains an int
# return 1 if the int is even, false if odd
is_even_s:
    andi t0, a0, 1      # a0 = a0 & 1
    beq t0, zero, even
    li a0, 0            # set up 0/false ret val
    j done              # jump over else case
even:
    li a0, 1            # set up 1/true ret val
done:
    ret
