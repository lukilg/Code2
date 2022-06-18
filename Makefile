Code2: Code2.o kwadratp.a szescianobj.so
	gcc -o Code2 Code2.o kwadratp.a ./szescianobj.so
	
Code2.o: Code2.c
	gcc -c Code2.c

kwadratp.o: kwadratp.c
	gcc -c kwadratp.c

szescianobj.o: szescianobj.c
	gcc -fPIC -c szescianobj.c

kwadratp.a: kwadratp.o
	ar rcs kwadratp.a kwadratp.o

szescianobj.so: szescianobj.o
	gcc -shared -o szescianobj.so szescianobj.o
	
clean:
	rm Code2 *.o *.a *.so
