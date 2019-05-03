subroutine language3(n,t,x,y,f)
	implicit none
	integer i,n,m
	real(8), dimension (n):: x,y
	real(8) t,f,u,v,w
	m=n-1
	do 10 i=3,m
      if(t.gt.x(i)) goto 10
      if(abs(t-x(i-1)).le.abs(t-x(i))) goto 20
10  continue
	i=n
20  i=i-1
    u=(t-x(i  ))*(t-x(i+1))/(x(i-1)-x(i  ))/(x(i-1)-x(i+1))
    v=(t-x(i-1))*(t-x(i+1))/(x(i  )-x(i-1))/(x(i  )-x(i+1))
    w=(t-x(i-1))*(t-x(i  ))/(x(i+1)-x(i-1))/(x(i+1)-x(i  ))
	f=u*y(i-1)+v*y(i)+w*y(i+1)
	return
    end