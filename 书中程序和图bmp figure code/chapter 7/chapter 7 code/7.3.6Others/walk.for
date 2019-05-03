c	   random walk simulation
c 
   	PROGRAM walk
c 
c 	   declarations
	REAL*8 root2, theta, x, y, r(1:10000)
        INTEGER i, j, max, seed
c
c	   set parameters
	max=10000
	seed=11168
	root2=1.4142135623730950488        
c
c  	   open file, seed generator
	OPEN(6, FILE='walk.dat')
c	   clear array
	DO 1 j = 1, max
	   r(j) = 0
 1	CONTINUE
c
c 	   execute
	DO 10 j = 1, 100
           x = 0
           y = 0
c
           DO 20 i = 1, max
              x = x + (ran(seed)-0.5)*2.0*root2
              y = y + (ran(seed)-0.5)*2.0*root2
              r(i) = r(i)+ SQRT(x * x + y * y)
 20        CONTINUE
 10	CONTINUE 
c
c 	   output data for plot of r vs. sqrt(N) 
  	DO 30 i = 1, max
           WRITE (6,*) SQRT(REAL(i)), ' ', r(i)/100
 30     CONTINUE
	STOP 
	END
