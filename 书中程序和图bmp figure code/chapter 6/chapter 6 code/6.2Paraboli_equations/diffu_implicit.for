! diffu_implicit.for
! implicit methods for finite diffrence
	external trid
	parameter (imax=21,kmax=50)
	dimension t(imax),a(imax),b(imax),c(imax),r(imax),u(imax)
	real dx,dt,lamda,kp,tmax,tmin
	open(2,file='diffu_2.dat')
	dx=0.5
	dt=0.2
	kp=0.835
	lamda=kp*dt/dx/dx
	tmax=100.
	tmin=0.
	write(*,*) 'lamda=',lamda
	do i=2,imax-1
!	   t(i)=tmax-(tmax-tmin)/(imax-1.)*(i-1.)
         t(i)=0.0
	end do
 	t(1)=tmax
	t(imax)=tmin
!	write(*,*) a(i),b(i),c(i)
	b(1)=1.
	c(1)=0.
	r(1)=t(1)
	a(imax)=0.
	b(imax)=1.
	r(imax)=t(imax)
	do i=2,imax-1
	   a(i)=-lamda
	   b(i)=1.+2.*lamda
	   c(i)=-lamda
	   r(i)=t(i)
	end do
	k=0
1	k=k+1
	call trid(a,b,c,r,u,imax)
	do i=1,imax
	   t(i)=u(i)
	   r(i)=u(i)
	end do
	   write(2,222)  (t(i),i=1,imax)
! 	   write(*,222)  (t(i),i=1,imax)
	if(k.lt.kmax) goto 1

222	format(1x,21(2x,f18.12))
	end

	subroutine trid(a,b,c,r,u,n)
      parameter (nmax=100)
	real gam(nmax),a(n),b(n),c(n),u(n),r(n)
	integer j,n
	if (b(1)==0.) pause 'b(1)=0 in trid'
	bet=b(1)
	u(1)=r(1)/bet
	do j=2,n
	    gam(j)=c(j-1)/bet
	    bet=b(j)-a(j)*gam(j)
	    if (bet==0.) pause 'bet=0 in trid'
	    u(j)=(r(j)-a(j)*u(j-1))/bet
	end do
	do j=n-1,1,-1
	    u(j)=u(j)-gam(j+1)*u(j+1)
	end do
	end subroutine trid
