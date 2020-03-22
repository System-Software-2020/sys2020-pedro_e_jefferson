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
	mv libfoo.a $(prefix)$(usrlib)
	mv lib/foo.h $(prefix)$(usrinclude)
	mv $(bin) $(prefix)$(usrbin)

uninstall:
	rm $(prefix)$(usrinclude)foo.h	
	rm $(prefix)$(usrlib)libfoo.a
	rm $(prefix)$(usrbin)$(bin)

foo.o: $(lib)/foo.c
	$(CC) $(C_FLAGS) -c $<

main001.o: $(scr)/main001.c
	$(CC) $(C_FLAGS) -c $<

.PHONY: .clean

clean:
	rm -f *.o
	rm -f *.a
	rm -f $(bin)