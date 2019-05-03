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