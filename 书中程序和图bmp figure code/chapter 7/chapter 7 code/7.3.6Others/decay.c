/* spontaneous decay simulation */

#include <stdio.h>
#include <math.h>

# define lambda 0.03 		/* the decay constant */
#define max 5000		    /* number of atoms at t=0 */
#define time_max 300		/* time range */

FILE *output;		    	/* internal file name */
static double xn=1;
 double rand()
{double l=16807; 
 double p=2147483647;
        xn=fmod(l*xn,p);
return xn/p;          }
void srand(double seed)
{    xn=seed;             }

main()
{
int atom, time, number, nloop;
double decay;
number=nloop=max;		            	    /* initial value */
output = fopen("decay.dat", "w");	        /* external file name */
srand(256);				                    /* seed number generator */
for (time=0; time<=time_max; time++)		/* time loop */
{
   for (atom=1; atom<=number; atom++)		/* atom loop */
   {
      decay=rand();
      if (decay<lambda) nloop--;		    /* an atom decays */
   }
   number=nloop;
   fprintf(output, "%d\t%f\n", time, (double) number/max);	
}
fclose (output); 
}
