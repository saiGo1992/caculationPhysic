! program diffu_explicit.for
! explicit methods for finite diffrence
	dimension T(51,51)
	real dx,dt,lamda,kp,Tmax,Tmin
	open(2,file='diffu_1.dat')
	dx=0.5
	dt=0.1
	kp=0.835
	lamda=kp*dt/dx/dx
	Tmax=100.
	Tmin=0.
	imax=21
	write(*,*) 'lamda=',lamda
	do i=1,50
	   do j=1,50
	      T(i,j)=0.0
	   end do
	end do
	
      do j=1,40
	   T(1,j)=Tmax
	   T(imax,j)=Tmin
	end do

	do j=1,40
	   do i=2,20
	      T(i,j+1)=T(i,j)+lamda*(T(i+1,j)-2.*T(i,j)+T(i-1,j))
	   end do
	   write(2,222)  (T(i,j),i=1,21)	   
	end do
222	 format(1x,21(2x,f18.10))
	end

