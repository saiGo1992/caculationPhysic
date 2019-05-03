/* This program is a short demonstration of the (simple) random walk algorithm. */
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <time.h>

/* rpt number the walk is repeated
   N length of the walk */
#define rpt 5
#define N 25

time_t syst;
FILE *textfile, *textfile2;
int x,y, r;
float R;

float myrandom(void)
/* generates a uniformly distributed number between 0 and 1 */
{return ((float) rand()/RAND_MAX);};

void walk(void)
{int i,ir;
 x=0; y=0; /*starting point */
 for (i=0; i<N-1; i++)
   {
     ir =  myrandom()*4;
     switch (ir)      {
      case 0: x+=1; break;
      case 1: y+=1; break;
      case 2: x-=1; break;
      case 3: y-=1;
      }
     fprintf(textfile2,"%i\t%i\t%i\n",i,x*x,y*y);
   }
}


int main()
{
 srand((unsigned) time(&syst));
 if((textfile=fopen("rw.dat","w"))!=NULL)
  if((textfile2=fopen("rw2.dat","w"))!=NULL)
  {
   fprintf(textfile,"i\tx^2\ty^2\tR\n");
   fprintf(textfile2,"i\tx^2\ty^2\n");
   for (r=0; r<rpt;r++)
   {
    walk(); R= sqrt(x*x+y*y);
    fprintf(textfile,"%i\t%i\t%i\t%g\n",r,x*x,y*y, R);
   }
   fclose(textfile);
   fclose(textfile2);
  }
}
