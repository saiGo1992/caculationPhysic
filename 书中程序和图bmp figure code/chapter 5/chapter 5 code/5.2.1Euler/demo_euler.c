/* demo_euler.c for euler method */
#include <math.h>
double euler(x,y,h,f)
double x,y,h; double(*f)();
{y+=h*(*f)(x,y);
   return(y);
}
double f(double x,double y)
{ return(y-2*x/y);
}
main()
{ int i;
  double x, y, h;
  x = 0; y = 1; h=0.1;
   for(i=0; i<10; i++)
     {y=euler(x,y,h,f); x+=h;
	 printf("\t%6.2f %12.6f\n",x,y);
   }
  return(0);
}