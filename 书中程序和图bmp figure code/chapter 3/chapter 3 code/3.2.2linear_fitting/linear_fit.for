      program linear_fit
!     linear_fit
	implicit none
      integer n,i,m
	parameter (n=7,m=20)
	real, dimension (n):: x,y
	real, dimension (m):: xi,yi
	real a,b,dx
	open(5,file='exa3_2_1.dat')
      open(2,file='exa3_2_1_old.dat')
	data x/0.5, 1.2, 2.1, 2.9, 3.6, 4.5, 5.7/
	data y/2.81,3.24,3.80,4.30,4.73,5.29,6.03/
      write(5,'(2f14.6)') (x(i),y(i),i=1,n)
      call fit(n,x,y,a,b)
	print *,'a=',a,'  b=',b
      
	dx=(x(n)-x(1))/(m-1)
	do i=1,m
	  xi(i)=x(1)+(i-1)*dx
	  yi(i)=a+b*xi(i)
	end do
      write(2,'(2f14.6)') (xi(i),yi(i),i=1,m)
	end

	subroutine fit(n,x,y,a,b)
	implicit none
	integer n,i
	real, dimension (n):: x,y
      real xp,yp,x2,xyp,a,b,c
	xp = 0.0
	yp = 0.0
	x2 = 0.0
	xyp= 0.0
	do i = 1,n
         x2 = x2+x(i)*x(i)
	   xp = xp+x(i)
	   yp = yp+y(i)
         xyp= xyp+x(i)*y(i)
	end do
      xp = xp/n
	yp = yp/n
	x2 = x2/n
	xyp= xyp/n
	c = x2-xp*xp 
      a = (yp*x2-xp*xyp)/c
	b = (xyp-xp*yp)/c 
      return
      end

      
