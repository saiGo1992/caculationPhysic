      program mc_3_1
	external f
	double precision a,b,f,eps,t
	a = 0.; b=6. ; eps = 0.000001
	call romb(a,b,f,eps,t,n)
	write(*,*) t, n
	end

	function f(x)
      external z
      double precision f,z,x
	f=z(x)*sqrt(2./3.1415926)*exp(-x*x/2.)
	end

	function z(x)
      double precision z,z1,x
	z = 0.
1     z1 = exp(-x*z)
      if(abs(z1-z).le.0.000001) return
	z = 0.5*(z1+z)
	goto 1
	end
      

	subroutine romb(a,b,f,eps,t,n)
	dimension y(10)
	double precision a,b,f,t,y,h,p,s,q,eps
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

	

