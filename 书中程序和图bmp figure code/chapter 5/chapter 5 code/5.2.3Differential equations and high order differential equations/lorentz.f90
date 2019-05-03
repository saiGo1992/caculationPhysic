program lorentz
implicit none
real(8) wc,h,z(6,1000),y(6), d(6),t
integer i,j,n,m
open(2,file='lorentz.txt')
y = (/1.,1.,0.,1.,0.,1./) ! 带电粒子初始位置和速度
n = 500                   ! 时间步数
m = 6                     ! 微分方程维数
h = 0.1                   ! 时间步长
t = 0.0
call rk4(t,y,m,h,n,z,d)
write(2,'(3f14.8)') (z(1,i),z(2,i),z(3,i),i=1,n)
end program lorentz

subroutine f(t,y,m,d)
real(8) y(m),d(m),wc,t
wc=1.0                  ! 回旋频率取1
d(1) = y(4)							                            
d(2) = y(5)
d(3) = y(6)
d(4) = wc*y(5)
d(5) =-wc*y(4)
d(6) = 0.                   
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
	end



