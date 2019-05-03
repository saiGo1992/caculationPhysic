! ÀıÌâ7.2.1 rand1.for
	program rand1
	implicit none
	real r
	integer n,c,x,i
      open(5,file='rand1.txt')
	n = 32768
	c = 889
	x = 13
      do i = 1,1000
	  x = c*x-n*int(c*x/n)
	  r = real(x)/(n-1)
        write(5,'(f8.5)') r
	end do
	end

