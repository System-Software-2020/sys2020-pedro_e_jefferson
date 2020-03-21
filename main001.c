#include <stdio.h>
#include <stdlib.h>

#define MAX 10
#define VAL  5

extern int foo(int, int);

int main ()
{
  int i;

  for (i=0; i < MAX; i++)
    printf ("foo(%d,%d) = %2d\n", i, VAL, foo(i, VAL));
  
  return EXIT_SUCCESS;
}
