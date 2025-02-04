PROGS = slen sumarr
SLEN_OBJS = slen.o slen_c.o slen_s.o
SUMARR_OBJS = sumarr.o sumarr_c.o sumarr_s.o

%.o: %.c
	gcc -c -g -o $@ $<

%.o: %.s
	as -g -o $@ $<

all: $(PROGS)

slen: $(SLEN_OBJS)
	gcc -g -o $@ $^

sumarr: $(SUMARR_OBJS)
	gcc -g -o $@ $^

clean:
	rm -rf $(PROGS) $(SLEN_OBJS) $(SUMARR_OBJS)
