      program treanor
	external f
      dimension y(2),d(2),p(2),z(4,2),g(4,2),r(4,2)
	double precision y,d,t,h,p,z,g,r
      data y/1.0,0.0/
	open(2,file='treanor.txt')
	t=0.0
	h=0.01
      m=2
	do i=1,1000
	  call tnr1(t,h,y,m,f,d,p,z,g,r)
	  t=t+h
        write(2,'(1x,f6.3,3x,d13.6,3x,d13.6)') t,y(1),y(2)
 	end do
	end

	subroutine f(t,y,m,d)
	dimension y(m),d(m)
	double precision y,d,t
	d(1)=998.*y(1)+1998.*y(2)
	d(2)=-999.*y(1)-1999.*y(2)
	return
	end

