CC=gcc -m32
LIB=./lib
SRC=./src
OUTPUT=main
FLAGS=-m32 -fno-pic -fno-pie

all: foo.o main001.o
	ar crs libfoo.a $<
	$(CC) $(FLAGS) -L. $^ -o $(OUTPUT) 

install: 
	mv libfoo.a $(prefix)/usr/lib/
	mv lib/foo.h $(prefix)/usr/include/
	mv $(OUTPUT) $(prefix)/usr/bin/

uninstall:
	rm $(prefix)/usr/include/foo.h	
	rm $(prefix)/usr/lib/libfoo.a
	rm $(prefix)/usr/bin/$(OUTPUT)

foo.o: $(LIB)/foo.c
	$(CC) $(FLAGS) -c $<

main001.o: $(SRC)/main001.c
	$(CC) $(FLAGS) -c $<

.PHONY: .clean

clean:
	rm -f *.o
	rm -f *.a
	rm $(OUTPUT)