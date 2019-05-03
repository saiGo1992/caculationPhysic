program bv ! 有限差分法
parameter(n=21)
real(8) a(n),b(n),c(n),d(n),y(n),x(n),u(n),v(n),w(n)
real(8) alfa,beta,h
open(2,file='bv.txt')
x(1) =2.0; x(n) = 3.0; alfa = 0; beta = 0
h = (x(n)-x(1))/(n-1.0)
do i=1,n
   x(i) = x(1) + (i-1)*h
   u(i) = -1.0
   v(i) = 0.
   w(i) = 2.0/x(i)/x(i)
   write(*,*) w(i)
   a(i) = u(i)-0.5*h*v(i)
   b(i) = h*h*w(i)-2.*u(i)
   c(i) = u(i)+0.5*h*v(i)
   d(i) = h*h/x(i)
end do
b(1) = 1.0; c(1) = 0; d(1) = alfa; 
a(n) = 0;   b(n) =1.; d(n) = beta
call tridag(a,b,c,d,y,n)
write(2,'(1x,2f12.6)') (x(i),y(i),i=1,n)
end program bv

subroutine tridag(a,b,c,d,y,n)
parameter (nmax=100)
real(8) gam(nmax),a(n),b(n),c(n),d(n),y(n)
integer j,n
if (b(1)==0.) pause 'b(1)=0 in tridag'
bet=b(1)
y(1)=d(1)/bet
do j=2,n
    gam(j)=c(j-1)/bet
    bet=b(j)-a(j)*gam(j)
    if (bet==0.) pause 'bet=0 in tridag'
    y(j)=(d(j)-a(j)*y(j-1))/bet
end do
do j=n-1,1,-1
    y(j)=y(j)-gam(j+1)*y(j+1)
end do
end subroutine tridag