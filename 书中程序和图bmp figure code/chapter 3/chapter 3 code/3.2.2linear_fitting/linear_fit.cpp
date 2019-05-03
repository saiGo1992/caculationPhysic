/*linear fitting*/
#include <stdio.h>
main()
{
 int n =7,i;
 float x[]={0.5, 1.2, 2.1, 2.9, 3.6, 4.5, 5.7};
 float y[]={2.81,3.24,3.80,4.30,4.73,5.29,6.03};
 float sx=0.,sy=0.,sxy=0.,sx2=0,deno,a,b;
 
 for(i=0;i<=6;i++) 
 {
  sx=sx+x[i];
  sy=sy+y[i];
  sxy=sxy+x[i]*y[i];
  sx2=sx2+x[i]*x[i];
 }
 
 deno=n*sx2-sx*sx;
 a=(sy*sx2-sx*sxy)/deno;
 b=(n*sxy-sy*sx)/deno;

 printf("a=%6.2f    b=%6.2f\n",a,b);
 return(0);
}
