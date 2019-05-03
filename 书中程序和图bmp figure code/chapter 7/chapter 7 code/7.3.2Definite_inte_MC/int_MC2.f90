    program int_MC2
	integer m,n,s,ntotal
	real(8) r,x,y,rand,iseed
	open(5,file='pi.txt')
	iseed = 1.0
	n = 100000
	m = 10000
	s = 0
	do ntotal=1,n
	  x=rand(iseed)
	  y=rand(iseed)
	  r=sqrt(x*x+y*y)
	  if(r<=1.0) s = s+1
	  if(mod(ntotal,m).eq.0) then
 	    print*,ntotal,4.0*float(s)/float(ntotal)
        write(5,'(2x,i8,3x,f18.8)') ntotal,4.0*float(s)/float(ntotal)
	  endif
	end do
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

      