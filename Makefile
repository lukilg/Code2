GCC = gcc -g
RMF = rm -f
RCS = ar rcs

SHARED = -shared -o
FPIC = -fPIC -c
O = -o
C = -c

PROGS = Code2 kwadratp szescianobj


Code2: Code2.o kwadratp.a szescianobj.so
	$(GCC) $(O) $@ $< kwadratp.a ./szescianobj.so
	
Code2.o: Code2.c
	$(GCC) $(C) $<	

kwadratp.o: kwadratp.c
	$(GCC) $(FPIC) $^

szescianobj.o: szescianobj.c
	$(GCC) $(FPIC) $^

kwadratp.a: kwadratp.o
	$(RCS) $@ $<

szescianobj.so: szescianobj.o
	$(GCC) $(SHARED) $@ $<
	
clean:
	$(RM) $(PROGS) *.o *.a *.out *~ *.so *.gch
