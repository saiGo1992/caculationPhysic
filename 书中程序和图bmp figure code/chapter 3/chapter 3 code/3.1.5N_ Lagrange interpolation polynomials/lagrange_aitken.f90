program lagrange_aitken
implicit none
integer, parameter :: n=9,m=21
integer :: i
real(8) :: xi(n),fi(n),pi,dx,x,f,df
open(2,file='exa3_1_4.txt')
open(3,file='exa3_1_4_old.txt')
  pi = 3.1415926
  dx = 2*pi/(n-1.)
do i = 1,n
  xi(i) = (i-1)*dx 
  fi(i) = sin(xi(i))
  write (3,*) xi(i),fi(i)
end do
dx = 2*pi/(m-1)
do i = 1,m
  x = (i-1)*dx
  call aitken (n,xi,fi,x,f,df)
  write (2,'(32x,3f16.8)') x,f,df
end do
end program lagrange_aitken
!
subroutine aitken (n,xi,fi,x,f,df)
implicit none
integer,parameter :: nmax=21
integer :: i,j,n
real(8) :: xi(n),fi(n),ft(nmax),x1,x2,f1,f2,df,f,x
if (n.gt.nmax) stop 'dimension too large'
do  i = 1, n
	ft(i) = fi(i)
end do
do  i = 1, n-1
	do j = 1, n-i
	   x1 = xi(j)
	   x2 = xi(j+i)
	   f1 = ft(j)
	   f2 = ft(j+1)
	   ft(j) = (x-x1)/(x2-x1)*f2+(x-x2)/(x1-x2)*f1
    end do
end do
f = ft(1)
df = (abs(f-f1)+abs(f-f2))/2.0
return
end


