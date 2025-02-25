# Tell the linker (gcc) that the function add2_s is
# callable from other modules, here main.c
.global add2_s

# a0 - int a arg
# a1 - int b arg

# a0 - conventional return value in RISC-V

add2_s:
    add t0, a0, a1  # t0 = a0 + a1
    mv a0, t0       # set up return value in a0
    ret 
