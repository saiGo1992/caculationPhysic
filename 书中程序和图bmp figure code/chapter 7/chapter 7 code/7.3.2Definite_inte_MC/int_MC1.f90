    ! 例题7.3.3
	program int_MC1
	real(8) f,s,a,b
	a = 2.5 ! 积分下限
	b = 8.4 ! 积分上限
	call int_mc(a,b,s)
	print *,'s = ', s
	end 

	function f(x)
	real(8) x
	f=x*x+sin(x)
	end

	subroutine int_mc(a,b,s)
	real(8) a,b,f,s,r,x
	integer m,i
	r = 1.0
	m = 10000
	s = 0.0
	do i = 1,m
	  x = a+(b-a)*rand(r)
	  s = s+f(x)
	end do
	s=s*(b-a)/real(m)
	return
	end

	function rand(r)
	real(8) s,u,v,r
	integer m
	s=65536.0
	u=2053.0
	v=13849.0
	m=r/s
	r=r-m*s
	r=u*r+v
	m=r/s
	r=r-m*s
	rand=r/s
	return
	end
