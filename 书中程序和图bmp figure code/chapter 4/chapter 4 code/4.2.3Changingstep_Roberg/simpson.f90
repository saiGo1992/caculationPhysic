program simpson  	! f=sin(x),fp=cos(x)
parameter(pi=3.1415926,n=64)
real(8) a(0:n),b(0:n),c(0:n),r(0:n),u(0:n)
real(8) x(0:n),f(0:n),fp(0:n),dx,d
integer i
open(2,file='exa4_1_3_old.txt')
open(5,file='exa4_1_3.txt')
dx = 2.0*pi/n
 d = 3.0/dx
fp(0) = 1.0         ! fp(0) = cos(0)  =1
fp(n) = 1.0         ! fp(n) = cos(2pi)=1
do i = 0,n
   x(i) = i*dx; f(i) = sin(x(i))
   write(2,'(2x,2f10.6)') x(i),f(i)
end do
a = 1.;	b = 4.; c = 1.   
do i = 1,n-1
   r(i) = 3.0*(f(i+1)-f(i-1))/dx
end do
r(1) = r(1)-fp(0); r(n-1) = r(n-1)-fp(n)
call tridag(a,b,c,r,u,n-1)   ! 注意三对角矩阵是n-1维
u(0) = fp(0); u(n) = fp(n)
do i = 0,n
  write(5,'(2x,2f10.6)') x(i),u(i)
end do
end

subroutine tridag(a,b,c,r,u,n)
parameter (nmax=500)
integer n,j
real(8) a(0:n),b(0:n),c(0:n),r(0:n),u(0:n)
real(8) bet,gam(nmax)
if(b(1).eq.0.)pause 'tridag: rewrite equations'
bet=b(1)
u(1)=r(1)/bet
do j=2,n
   gam(j)=c(j-1)/bet
   bet=b(j)-a(j)*gam(j)
   if(bet.eq.0.)pause 'tridag failed'
     u(j)=(r(j)-a(j)*u(j-1))/bet
end do
do j=n-1,1,-1
   u(j)=u(j)-gam(j+1)*u(j+1)
end do
return
end
