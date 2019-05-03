      program mc_3_3
      double precision x,r1,r2,r3,a
	ix = 32765; n = 4000
	x = 0.
	do k=1,n
	   call rand(ix,r1)
         call rand(ix,r2)
	   call rand(ix,r3)
	   a = sqrt(-2.*log(r1))*sin(0.5*3.1415926*r2)
         if(r3.le.exp(-a*r3)) x=x+1.0
	end do
	x=x/4000.
	write(*,*) x
	end

  	subroutine rand(ix,r)
	double precision r
      i = ix*259
	ix = i-i/32768*32768
	r = float(ix)/32768
	return
	end

	