// THE CHALLENGE - Find a rectangle with the same perimeter as area, while having its length be 3 inches more then its width.
#include <stdio.h>

int main(void) {
  int a; // x dimension 
  int b; // y dimension
  int c; // area
  int d; // perimeter
  int e; // equation
  a = 1; // minimal possible
  b = 4;
  for(int a=a, b=b, c=c, d=d, e=e;c==d;) {
    a++;
    b++;
    c = a*b;
    d = a*2+b*2;
    if(/*a+3 == b && [unneeded]*/c == d) {
       e = c;
       printf("Area/perimeter is %d", e, "\n");
       e = a;
       printf("Length is %d", e, "\n");
       e = b;
       printf("Width is %d", e, "\n");
    }
  }
  return 0;
}
