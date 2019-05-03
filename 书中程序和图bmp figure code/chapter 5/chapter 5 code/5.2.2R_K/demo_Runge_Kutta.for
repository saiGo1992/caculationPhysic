!	runge-kutta method of order 4
!     y' = x*y^(1/2)
!     y0 = 4
!      external f
	program demo_runge_kutta
	implicit none
	integer,parameter :: n = 100
	integer :: i
	real(8):: y(0:n),x(0:n),h
	open(2,file='EXA_5_3.txt')
	x(0) = 2.0; x(n) = 3.0
	y(0)= 4.0
	h = (x(n)-x(0))/n
  	call rk4(x,y,h,n)
	write(2,'(2f14.8)') (x(i),y(i),i=0,n)
	end
	
	function f(x,y)
	real(8) :: x,y,f
	f=x*sqrt(y)
	end

	subroutine rk4(x,y,h,n)
	integer :: i
	real(8) :: f,h,h2,k1,k2,k3,k4,x(0:n),y(0:n)
	h2=0.5*h
	do i=0,n-1
	  k1=h*f(x(i),y(i))
	  k2=h*f(x(i)+h2,y(i)+0.5*k1)
	  k3=h*f(x(i)+h2,y(i)+0.5*k2)
	  k4=h*f(x(i)+h,y(i)+k3)
	  y(i+1)=y(i)+(k1+k2+k2+k3+k3+k4)/6.0
	  x(i+1)=x(0)+h*real(i)
      end do
	end


