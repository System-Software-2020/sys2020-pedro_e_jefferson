  Exercise: Reverse engineer a library.
  ------------------------------------

  Good evening Mr. Hunt.

  Inside this directory you will find a few software artifacts retrieved from
  a confidential repository by means which shall not be disclosed. Any further
  information on the referred project is officially considered classified.
  Nevertheless, an intelligence authority has reasons to believe that the
  knowledge of the software source code is of utmost strategical value.
  Unfortunately, however, the package was not retrieved in its integrity
  such that part of the software was only obtained in binary form.
  
  Your mission, should you accept it, is to reverse engineering the software
  fragment and reconstruct it originating source code, or at least one
  which might have been used to produce the binary artifacts. In-depth
  technical details and directions to complete this task follows.

  As always should you or any of your team would be caught, or killed the
  secretary will disavow any knowledge of your actions. This message will
  not self-destruct in five seconds..


  * SOFTWARE FRAGMENTS

  The only package fragment obtained in source code form comprises a C
  program excerpt found in file 'main001.c'.It its is believe this file
  is used to build an executable program named 'main001'.
  
  The referred source code contains a call to a function 'foo' which,
  apparently, is implemented by a software library 'libfoo'. A static
  version of the library was obtained in binary form.

  Preliminary analysis of the package seems to indicate that it is meant
  to build and execute under a POSIX compliant software runtime, on a x86
  hardware architecture.  This is all that is known so far.

  The present mission consists in recreating all the software artifacts
  in source code form and providing a suitable automation build script.

  To that end shall consider the tools listed bellow.


  * MISSION DETAILS

  1) Verify which target platform the library was built to.

     As suggestion, inspect the binary file with the aid of the
     system tool 'hexdump':

     	    $ hexdump -C libfoo.a

     This shall exhibit the contents of the file in hexadecimal format.

     Have a look at the first bytes of the output to figure out what
     kind of binary format you are dealing with.  Often, binary files'
     headers contain a signature to expose this information.

     Reference [1] may be of use.

     The well-known system utility 'file' implements several heuristics
     to identify file formats. You may use to provide further evidences
     for your hypothesis.

  2) Build the executable program.

     Having identified the library's target platform, use an appropriate
     compiler to build the executable out of the library and the provided
     software. The multiplatform GCC compiler shall accomplish the goal.


     	    $ gcc $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) main001.c libfoo.a

     You will probably need to set linker flags to locate the library
     within the current directory and CFLAGS to aim at the correct
     target architecture.

     Once you have successfully built the binary, execute it and observe
     the output. Then, inspect 'main001.c' and derive a hypothesis on the
     behavior implemented by function 'foo'.

  3) Disassemble the library.

     First, use the system utility 'ar' to extract the objects composing
     the library (see 'ar' documentation). Locate the object implementing
     function 'foo' (it shall be straightforward).

     Then the system utility 'objdump' to disassemble the library's objects.

     	    $ objdump $(OBJDUMPFLAGS) $(object)

     Objdump generates both Intel and AT&T syntax and supports both
     32 bit and 64 bit x86 assembly.

     Create and set aside a file 'foo.asm' containing the assembly code.

     Go through the assembly of the relevant object and figure out its
     intended behavior.

     Comment down file 'foo.asm' so that one can easily grasp the purpose
     of the code in it.

  4) Reconstruct the source code.

     Create file 'foo.c containing a C source code which, when compiled
     would generate an assembly equivalent to 'foo.asm'. To that end,
     assume a parsimonious approach (i.e. the less code, the better).

     Create a header file 'foo.h' and comment down it so as to completly
     specify libfoo's API (inform the function expected behavior,
     accepted arguments, return value etc.)

     Create a 'Makefile' build script which can be processed by system
     utility 'make' to automate the build process. The script should support
     the targets 'all' (default), 'clean', 'install' and 'uninstall'.

     The targets should implement the conventional functionality [2]:

     all: build libfoo.a and main001

     install: copy libfoo.a, foo.h and main001, respectively to
     	      $(prefix)/usr/lib, $(prefix)/usr/include and
	      $(prefix)/usr/bin

     uninstall: undue 'make install'

     clean: remove generated files from source tree

     If $(prefix) is not set from command line, it should be empty.

     The source tree for this project should abide to the following structure:

     <project-root-dir>
         Makefile
         src/
           main001.c
         lib/
           foo.c
	   foo.h
         
     Rule 'all' should build the library within lib/ and the binary
     within src/. 

  * OTHER REQUIREMENTS

    Fill in file AUTHORS with your full name and email.

    Submit your mission assignment to the master branch of your Git
    repository and add it a release tag 'ex2done' to indicate
    "Mission accomplished".

    Ethan, good luck.

  * REFERENCES

    [1] Executable and Linking Format
    	https://wikipedia.org/wiki/Executable_and_Linking_Format

    [2] Make, Standard Targets for Users
    https://www.gnu.org/software/make/manual/html_node/Standard-Targets.html#Standard-Targets
