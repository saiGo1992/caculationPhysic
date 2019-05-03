program shoot       ! 打靶法求例题
parameter (m = 2,n = 100,eps = 0.00001)
real(8) h,z(m,n),y(m),d(m),x1,xn,yb,alfa,beta,g1,g2
integer i,j
! open(2,file='shoot1.txt') ! 有空气阻力
open(2,file='shoot0.txt')   ! 没有空气阻力
alfa = 0.0; beta = 40.0; g1 = 30.0
x1 = 0.0 ; xn = 5.0     ! a, b
            
h = (xn-x1)/(n-1)     ! 步长
y(1) = alfa           ! y(a), z(1,:)是y, z(2,:)是dy/dx
y(2) = g1         ! 初始输入猜测dy(a)/dx值
call rk4(x1,y,m,h,n,z,d)
yb = z(1,n)
y(1) =alfa
y(2) = beta*g1/z(1,n)
g2 =y(2)
call rk4(x1,y,m,h,n,z,d)

if (abs(z(1,n)-beta)>eps) then
  y(1) = alfa
  y(2) = g2 + (beta-z(1,n))*(g2-g1)/(z(1,n)-yb)
  g1 = g2
  g2 = y(2)
  yb = z(1,n)
  call rk4(x1,y,m,h,n,z,d)
end if
print *, 'z(2,1)=',z(2,1)
do i=1,n
  x=x1+(i-1)*h
  write(2,'(2f14.8)') x,z(1,i)
end do
end 

subroutine f(x,y,m,d)
real(8) y(m),d(m),x
d(1) = y(2)      ! y(1):空间高度, y(2):速度, x:时间
d(2) = -9.8							                            
! d(2) = -9.8-0.1*y(2)
end

subroutine rk4(t,y,m,h,n,z,d)
real(8) y(m),d(m),z(m,n),a(4),b(m),t,h,xx,tt
	a(1)=h/2.0
	a(2)=a(1)
	a(3)=h
	a(4)=h
	do 5 i=1,m
5	z(i,1)=y(i)
	xx=t
	do 100 j=2,n
	  call f(t,y,m,d)
	  do 10 i=1,m
10	  b(i)=y(i)
	  do 30 k=1,3
	    do 20 i=1,m
	      y(i)=z(i,j-1)+a(k)*d(i)
	      b(i)=b(i)+a(k+1)*d(i)/3.0
20	    continue
	    tt=t+a(k)
	    call f(tt,y,m,d)
30	  continue
	  do 40 i=1,m
40	  y(i)=b(i)+h*d(i)/6.0
	  do 50 i=1,m
50	  z(i,j)=y(i)
	  t=t+h
100	continue
	t=xx
	return
	end



