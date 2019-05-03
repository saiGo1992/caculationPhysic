/*   MC1.c */
#include<math.h>
static double xn=1;
double rand()
{   double lambda=16807,p=2147483647;
xn=fmod(lambda*xn,p);
return xn/p;          }
void srand(double seed)
{    xn=seed;             }
main()
{  int i,n= 10000,k,na=0,np=0,nr=0;
   double pi=3.1415926,s,theta,pa,pp,pr;
   srand(256);
   for(i=1;i<=n;i++)
  {k=0;s=0;
     do{ theta=2*pi*rand();
       s+=cos(theta);k++;
       if(s<0){nr++;break;}
       if(s>5){np++;break;}
       if(k>10){na++;break;}}
   while(1);}
 pp=(double)np/n* 100; pa=(double)na/n* 100; pr=(double)nr/n* 100;
 printf("PP=%6.2f%%PA=%6.2f%%PR=%6.2f%%\n",pp,pa,pr);
}