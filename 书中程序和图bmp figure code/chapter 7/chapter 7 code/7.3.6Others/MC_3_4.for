      program mc_3_4
      double precision x,r1,r2,r3,a
	ix = 32765; n = 4000
	rmin=1.; rmax=0.
	do k=1,n
	   call rand(ix,r1)
         call rand(ix,r2)
	   call rand(ix,r3)
	   a = sqrt(-2.*log(r1))*sin(0.5*3.1415926*r2)
         if(r3.gt.exp(-a*r3).and.r3.le.rmin) rmin=r3
	   if(r3.lt.exp(-a*r3).and.r3.ge.rmax) rmax=r3
	end do
	x=0.5*(rmax+rmin)
	write(*,*) x
	end

  	subroutine rand(ix,r)
	double precision r
      i = ix*259
	ix = i-i/32768*32768
	r = float(ix)/32768
	return
	end

	