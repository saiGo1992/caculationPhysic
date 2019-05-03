  #include "stdio.h"
  #include "gauss.c"
  main()
  { int i;
    static double a[3][3]=
           { {1,-1, 1},
             {5,-4, 3},
             {2, 1, 1} };
    static double b[3]={-4,-12,11};
    if (gauss(a,b,3)!=0)
      for (i=0;i<=2;i++)
        printf("x(%d) =  %e\n",i,b[i]);
  
  }
 