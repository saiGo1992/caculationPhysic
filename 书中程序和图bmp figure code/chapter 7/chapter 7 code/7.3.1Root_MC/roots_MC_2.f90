!!!!!!!!!!!! roots_MC_2.f90 !!!!!!!!!!!
	program roots_MC_2
	implicit none
	real(8) x,a,b,r,rp,rm,f,p
	integer ix,n,i
    a=0.0; b=3.1415926/2.0
!    a=0.0;b=1.0
	ix=32765
	n=2000
    rp=0.0; rm=1.0 !注意：首先将最大赋值最小，将最小赋值最大
	if(f(a)<0) then
	  do i=1,2000
	    call rand(ix,r)
          if(f(a+(b-a)*r)<=0.0) then
		     call amax(r,rp)
		  else
		     call amin(r,rm)
		  end if
	   end do
	 else
	   do i=1,2000
	    call rand(ix,r)
          if(f(a+(b-a)*r)>=0.0) then
		     call amax(r,rp)
		  else
		     call amin(r,rm)
		  end if
	   end do
	  end if
	 p=(rp+rm)/2.0
	 x=a+(b-a)*p
	 write(*,*) 'x=',x
	end program roots_MC_2
	
	subroutine amax(x,xmax)
	implicit none
	real(8) x,xmax
       if(xmax.ge.x) then
	     return
	   else 
	     xmax=x
       end if
	return
	end

	subroutine amin(x,xmin)
	implicit none
	real(8) x,xmin
       if(xmin.le.x) then
	     return
	   else 
	     xmin=x
       end if
	return
	end

	function f(x)
	real(8) x
	f=exp(-x*x*x)-tan(x)+800.0
!    f=x-exp(-x)
	return
	end
	
	subroutine rand(ix,r)
	real(8) r
	integer ix
	i=ix*259
	ix=i-i/32768*32768
	r=float(ix)/32768
	return
	end



    
