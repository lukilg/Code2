GCC = gcc -g
RMF = rm -f
RCS = ar rcs

SHARED = -shared -o
FPIC = -fPIC -c
O = -o
C = -c

.PHONY: clean
.SUFFIXES: .c .o .a .so

PROGS = Code2 kwadratp szescianobj

all: $(PROGS)

Code2: Code2.o kwadratp.a szescianobj.so
	$(GCC) $(O) $@ $< kwadratp.a ./szescianobj.so
	
.c.o:
	$(GCC) $(C) $<

p%.a: p%.o
	$(RCS) $@ $<

o%.so: o%.o
	$(GCC) $(SHARED) $@ $<
	
clean:
	$(RM) $(PROGS) *.o *.a *.out *~ *.so *.gch
