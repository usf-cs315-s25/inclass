PROGS = is_even countdown sum
IS_EVEN_OBJS = is_even.o is_even_c.o is_even_s.o
COUNTDOWN_OBJS = countdown.o countdown_c.o countdown_s.o
SUM_OBJS = sum.o sum_c.o sum_s.o

%.o: %.c
	gcc -c -g -o $@ $<

%.o: %.s
	as -g -o $@ $<

all: $(PROGS)

is_even: $(IS_EVEN_OBJS)
	gcc -g -o $@ $^

countdown: $(COUNTDOWN_OBJS)
	gcc -g -o $@ $^

sum: $(SUM_OBJS)
	gcc -g -o $@ $^

clean:
	rm -rf $(PROGS) $(IS_EVEN_OBJS) $(COUNTDOWN_OBJS) $(SUM_OBJS)
