lib =./lib
scr =./src
bin =main
obj =foo.o main001.o
usrlib =/usr/lib/
usrinclude =/usr/include/
usrbin =/usr/bin/

CC =gcc
CPP_FLAGS = 
C_FLAGS =-m32 -fno-pic -fno-pie
LD_FLAGS =


all: $(obj)
	ar crs libfoo.a $<
	$(CC) $(C_FLAGS) -L. $^ -o $(bin) 

install: 
	mv libfoo.a $(usrlib)
	mv lib/foo.h $(usrinclude)
	mv $(bin) $(usrbin)

uninstall:
	rm $(usrinclude)foo.h	
	rm $(usrlib)libfoo.a
	rm $(usrbin)$(bin)

foo.o: $(lib)/foo.c
	$(CC) $(C_FLAGS) -c $<

main001.o: $(scr)/main001.c
	$(CC) $(C_FLAGS) -c $<

.PHONY: .clean

clean:
	rm -f *.o
	rm -f *.a
	rm -f $(bin)