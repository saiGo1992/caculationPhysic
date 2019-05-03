! demo_secant.f90
program demo_secant
! main program to use the secant method to find the root of
! f(x)=exp(x)*ln(x)-x*x=0.  copyright (c) tao pang 1997.
  implicit none
  integer istep
  real(8) a,b,dl,pi
!
  dl = 1.0e-06
  pi = 3.1415926
   a  = 1.0
   b  = 2.0
  ! a = pi/4 
  ! b =  pi+3*pi/4
  call secant(a,b,dl,istep)
end program demo_secant
!
subroutine secant (a,b,dl,istep)
! subroutine for the root of f(x)=0 with the secant method.
  implicit none
  integer istep
  real(8) a,b,d,f,c,dx,dl
  istep = 0
  dx = b-a
  do while (abs(dx).gt.dl)
    d = f(b)-f(a)
    c = b-f(b)*(b-a)/d
	if(f(a)*f(c)>0) then
	   dx=c-a
	   a = c
	else
	   dx = b-c
	   b = c
	end if
    istep = istep+1
	write(*,*) 'c(',istep,') =',c, '  dx =  ',dx
  end do
end subroutine secant
!
function f(x)
  implicit none
  real(8) x,f
  f = exp(x)*log(x)-x*x
  ! f = sin(x)
end function f
