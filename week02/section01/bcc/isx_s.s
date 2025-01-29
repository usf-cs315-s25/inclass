.global isx_s

# a0 contains a char
# return 1 (true) if the char is 'x' otherwise 0 (false)

isx_s:
    li t0, 'x'      # t0 = 'x' using Load Immediate
    bne a0, t0, not_equal
    li a0, 1        # set up true ret val
    j done
not_equal:
    li a0, 0        # set up false ret val
done:
    ret
