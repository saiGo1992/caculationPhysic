! demo_bisect.f90
program demo_bisect
! this program uses the bisection method to find the root of
! f(x)=exp(x)*ln(x)-x*x=0.  
  implicit none
  integer :: istep
  real :: a,b,eps,dx,x0,x1,f,fx
    eps = 1.0e-06
      a = 1.0
      b = 2.0
     dx = b - a
  istep = 0
  do while (abs(dx).gt.eps)
     x0 = (a+b)/2.0
     if ((fx(a)*fx(x0)).lt.0) then
       b  = x0
       dx = b-a
     else
       a  = x0
       dx = b-a
     end if
     istep = istep+1
    write (6,"(i4,2f16.8)") istep,x0,dx
  end do
end program demo_bisect
!
function fx(x) result (f)
  implicit none
  real :: f
  real, intent (in) :: x
  f = exp(x)*log(x)-x*x
end function fx
