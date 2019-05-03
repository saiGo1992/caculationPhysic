!!!!!!rand2.for!!!!!
	program rand2
	implicit none
	integer, parameter :: n=1000
	integer ix,i
	real r
	open(5,file='rand2.txt')
	ix=32765
	do i=1,n
	  call rand(ix,r)
	  write(5,'(f8.6)') r
	end do
	end program rand2

	subroutine rand(ix,r)
	i=ix*259
	ix=i-i/32768*32768
	r=float(ix)/32768
	return
	end
	

		
