! ÀýÌâ7.3.1
	program roots_MC1
    implicit none
	real b,bmax,a,h,f,x
	open(5,file='x.txt')
    b=0.0; bmax=4.0; h=0.3
4   a=b
    b=b+h
	if((f(a)*f(b)).gt.0.0) goto 4
    call sr(a,b,x)
	write(5,'(f12.8)') x
    write(*,'(f12.8)') x
    if(b.lt.bmax) goto 4
	end 
	

    subroutine sr(a,b,x)
	implicit none
	real r,xr,x,a,b,p,f
	integer ix,n,m,i
	ix=32765; n = 4000; m = 0
    do i =1,n
      call rand(ix,r)
	  xr=a+(b-a)*r
	  if(f(xr).le.0.0) m = m+1
	end do
	p = real(m)/real(n)
    if(f(a).le.0.0) then
	  x=a+(b-a)*p
	else
	  x=a+(b-a)*(1.0-p)
	end if
	return
	end

	function f(x)
    implicit none
	real x,f
!	f=exp(x)*(log(x)-x*x)
	f=(((x-10.0)*x+35.0)*x-50.0)*x+24.0
	return
	end

		
	subroutine rand(ix,r)
	i=ix*259
	ix=i-i/32768*32768
	r=float(ix)/32768
	return
	end

