PROG = emu
OBJS = add2_s.o emu.o

%.o : %.c
	gcc -c -g -o $@ $<

%.o: %.s 
	as -g -o $@ $<

$(PROG): $(OBJS)
	gcc -g -o $@ $^

clean: 
	rm -rf $(PROG) $(OBJS)
