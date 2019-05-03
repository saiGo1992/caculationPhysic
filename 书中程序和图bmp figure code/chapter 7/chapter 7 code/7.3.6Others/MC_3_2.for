      program mc_3_2
      double precision x,r1,r2,a,z
	ix = 32765; n = 4000
	x = 0.
	do k=1,n
	   call rand(ix,r1)
         call rand(ix,r2)
	   a = sqrt(-2.*log(r1))*sin(0.5*3.1415926*r2)
         x = x + z(a)
	end do
	x=x/4000.
	write(*,*) x
	end

	function z(x)
      double precision z,z1,x
	z = 0.
1     z1 = exp(-x*z)
      if(abs(z1-z).le.0.000001) return
	z = 0.5*(z1+z)
	goto 1
	end
  
  	subroutine rand(ix,r)
	double precision r
      i = ix*259
	ix = i-i/32768*32768
	r = float(ix)/32768
	return
	end

	