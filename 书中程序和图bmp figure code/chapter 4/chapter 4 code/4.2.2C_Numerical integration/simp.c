# include<stdio.h>
# include<math.h>
# define f(x) 4./(1+(x)*(x))
void main(void)
{ float a = 0., b = 1., s, h;
  int n = 100, i;
  h = (b-a)/n;
  s = f(a)+f(b);
  for(i=1;i<=n-1;i++)
     { if(i%2==0)
	 	 s = s+2.0*f(a+i*h);
       else
		 s=s+4.*f(a+i*h);
	 }
  s = s*h/3;
  printf("%10.5f\n",s);
}


