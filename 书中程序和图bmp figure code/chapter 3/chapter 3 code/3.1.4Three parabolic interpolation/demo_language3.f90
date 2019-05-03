	
	program demo_language3
	integer, parameter :: nmax=9,m=21
	real(8), dimension (nmax):: x,y
	real(8) t,f,dt
	integer i
	open(5,file='exa3_1_3.dat')
    open(2,file='exa3_1_3_old.dat')
    dt=2*3.1415926/(nmax-1)
	x(1)=0.0
    y(1)=sin(x(1))
	do i=1,nmax-1
	   x(i+1)=x(i)+dt
	   y(i+1)=sin(x(i+1))
	end do   
	write(2,'(2f10.6)') (x(i),y(i),i=1,nmax)
	dt=(x(nmax)-x(1))/(m-1)
	t=x(1)-dt
	do i=1,m
	   t=t+dt
	   call language3(nmax,t,x,y,f)
	   write (*,*) 'f(',t,')=',f
	   write(5,'(2f10.6)') t,f
	end do
	end 
