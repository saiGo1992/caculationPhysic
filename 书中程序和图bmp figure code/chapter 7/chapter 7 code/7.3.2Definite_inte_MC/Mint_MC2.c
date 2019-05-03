/* Mint_MC2.c ÀıÌâ7.3.6 */
#include<math.h>
#define f(x,y) x*y*y
static double xn=1;
double rand()
{ double lambda=16807, p=2147483647;
xn=fmod(lambda*xn,p);
return xn/p;          }
void srand(double seed)
{    xn=seed;         }
main()
{    int i,n=15000; double x, y, s=0;
srand(4);
for(i=0; i<n; i++)
{    x=rand()+2/3.0; y=(3*x-2)*rand()+(2-x);
s=s+(3*x-2)*f(x, y);}
s=s/n;
printf("N=%8d V=% 10.6f\n", n, s);
}