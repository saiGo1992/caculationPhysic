      program trapezia
	external f
	real(8) f,a,b,s
	a=0.0; b=1.0; eps=1.e-6
	call trap(a,b,f,eps,s,n)
	write(*,10) s,n
10	format(1x,'s=',d15.6,3x,'n=',i5)
	end

	function f(x)
	real(8) x
	f=exp(-x*x)
	end

      subroutine trap(a,b,f,eps,t,n)
	real(8) a,b,f,t,fa,fb,h,t0,s,x
	fa=f(a); fb=f(b)
	n=1; h=b-a
	t0=h*(fa+fb)/2.0
5	s=0.0
	do 10 k=0,n-1
	  x=a+(k+0.5)*h
	  s=s+f(x)
10	continue
	t=(t0+h*s)/2.0
	if (abs(t-t0).ge.eps) then
	  t0=t
	  n=n+n
	  h=h/2.0
	  goto 5
	end if
	return
	end