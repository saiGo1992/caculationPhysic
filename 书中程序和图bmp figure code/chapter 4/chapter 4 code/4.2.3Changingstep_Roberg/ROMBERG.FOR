      program romberg
	external f
	double precision f,a,b,s
	a=0.0
	b=1.0
	eps=0.000001
	call romb(a,b,f,eps,s,n)
	write(*,10) s,n
10	format(1x,'s=',d15.8,1x,'n=',i6)
	end program romberg

	function f(x)
	double precision f,x
!      f=log(1+x)/(1+x*x)
!	f=x/(4+x*x)
      f=4./(1.+x*x)
	return
	end 

      subroutine romb(a,b,f,eps,t,n)
	dimension y(10)
	double precision a,b,f,t,y,h,p,s,q
	h=b-a
	y(1)=h*(f(a)+f(b))/2.0
	m=1
	n=1
10	p=0.0
	do 20 i=0,n-1
20	p=p+f(a+(i+0.5)*h)
	p=(y(1)+h*p)/2.0
	s=1.0
	do 30 k=1,m
	  s=4*s
	  q=(s*p-y(k))/(s-1)
	  y(k)=p
	  p=q
30	continue
	if ((abs(q-y(m)).ge.eps).and.(m.le.9)) then
	  m=m+1
	  y(m)=q
	  n=n+n
	  h=h/2.0
	  goto 10
	end if
	t=q
	return
	end
