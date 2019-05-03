/* Mint_MC3.c ÀıÌâ7.3.7 */
#include<math.h>
static double xn=1;
double rand()
{ double lambda=16807, p=2147483647;
xn=fmod(lambda*xn,p);
return xn/p;          }
void srand(double seed)
{    xn=seed;         }
main()
{    int i,n=10000,m=0; double x, y, z, v=0;
srand(256);
for(i=0; i<n; i++)
{    x=-0.5+rand(); y=-0.5+rand(); z = -0.5+rand();
if((sqrt(x*x+y*y+z*z)<=0.5)&&(sqrt(x*x+y*y)>=0.3))
m = m+1;}
v = 1.*(double)m/n;
printf("N=%8d V=% 10.6f\n", n, v);
}