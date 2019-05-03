program demo_sor
!driver program for routine sor
parameter(n=5,eps=1.e-7,om=1.3)
dimension a(n,n),c(n,n),r(n),b(n),x(n)
data a/1.,1.,0.,0.,0.,1.,2.,1.,0.,0.,&
       0.,1.,3.,1.,.0,0.,0.,1.,4.,1.,&
	   0.,0.,0.,1.,5./
data b/2.,4.,5.,6.,6./
c = a
r = b
x = 0.0
call sor(c,n,r,x,eps,om,ii)
write(*,*) 'solution vector'
write(*,'(1x,5f12.6)') (x(l), l=1,n)
write(*,*) 'iteration times =',ii
end

subroutine sor(a,n,b,x,eps,om,ii)
parameter(imax=200)
real a(n,n),b(n),x(n)
integer i,j,ii
real r,rx
do i=1,n
  r=1./a(i,i)
  b(i)=b(i)*r
  do j=1,n
    a(i,j)=a(i,j)*r
  end do
end do
do ii=1,imax
  rx=0.0
  do i=1,n
    r=b(i)
    do j=1,n
      r=r-a(i,j)*x(j)
    end do
    if (abs(r)>rx) rx=abs(r)
      x(i)=x(i)+om*r
  end do
  if (om*rx<=eps)  return
end do
pause  'too many iterations'
end subroutine sor