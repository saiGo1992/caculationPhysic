!  ÌØÀ×ÄÉ£¨treanor£© ·½·¨	
	subroutine tnr1(t,h,y,m,f,d,p,z,g,r)
	dimension y(m),d(m),z(4,m),g(4,m)
	dimension p(m),r(4,m)
	double precision y,d,z,g,p,r,t,h,x,s,aa,bb,dd,q,dy,dy1
	x=t
	do 50 j=1,m
50	z(1,j)=y(j)
	call f(t,y,m,d)
	do 60 j=1,m
	  g(1,j)=d(j)
	  y(j)=z(1,j)+h*d(j)/2.0
	  z(2,j)=y(j)
60	continue
	s=t+h/2.0
	call f(s,y,m,d)
	do 70 j=1,m
	  g(2,j)=d(j)
	  y(j)=z(1,j)+h*d(j)/2.0
	  z(3,j)=y(j)
70	continue
	call f(s,y,m,d)
	do 80 j=1,m
80	g(3,j)=d(j)
	do 90 j=1,m
	  aa=g(3,j)-g(2,j)
	  bb=z(3,j)-z(2,j)
	  if (-aa*bb*h.gt.0.0) then
	    p(j)=-aa/bb
	    dd=-p(j)*h
	    r(1,j)=exp(dd)
	    r(2,j)=(r(1,j)-1)/dd
	    r(3,j)=(r(2,j)-1)/dd
	    r(4,j)=(r(3,j)-1)/dd
	  else
	    p(j)=0.0
	  end if
	  if (p(j).le.0.0) then
	    q=g(3,j)
	  else
	    q=2*(g(3,j)-g(1,j))*r(3,j)
	    q=q+(g(1,j)-g(2,j))*r(2,j)+g(2,j)
	  end if
	  z(4,j)=z(1,j)+q*h
	  y(j)=z(4,j)
90	continue
	s=t+h
	call f(s,y,m,d)
	do 100 j=1,m
100	g(4,j)=d(j)
	do 110 j=1,m
	  if (p(j).le.0.0) then
	    dy=(g(1,j)+2*(g(2,j)+g(3,j))+g(4,j))*h/6.0
	  else
	    dy=-3*(g(1,j)+p(j)*z(1,j))+2*(g(2,j)+p(j)*z(2,j))
	    dy=dy+2*(g(3,j)+p(j)*z(3,j))-(g(4,j)+p(j)*z(4,j))
	    dy=dy*r(3,j)+g(1,j)*r(2,j)
	    dy1=g(1,j)-g(2,j)-g(3,j)+g(4,j)
	    dy1=dy1+(z(1,j)-z(2,j)-z(3,j)+z(4,j))*p(j)
	    dy=(dy+4*dy1*r(4,j))*h
	  end if
	  y(j)=z(1,j)+dy
110	continue
	t=x
	return
	end

