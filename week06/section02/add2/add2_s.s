.global add2_s

add2_s:
    add t0, a0, a1      # t0 = a0 + a1
    mv a0, t0           # set up ret val in a0
    ret
