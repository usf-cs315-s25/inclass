PROGS = slen sumarr add3
SLEN_OBJS = slen.o slen_c.o slen_s.o
SUMARR_OBJS = sumarr.o sumarr_c.o sumarr_s.o
ADD3_OBJS = add3.o add3_c.o add3_s.o

%.o: %.c
	gcc -c -g -o $@ $<

%.o: %.s
	as -g -o $@ $<

all: $(PROGS)

slen: $(SLEN_OBJS)
	gcc -g -o $@ $^

sumarr: $(SUMARR_OBJS)
	gcc -g -o $@ $^

add3: $(ADD3_OBJS)
	gcc -g -o $@ $^

clean:
	rm -rf $(PROGS) $(SLEN_OBJS) $(SUMARR_OBJS) $(ADD3_OBJS)
