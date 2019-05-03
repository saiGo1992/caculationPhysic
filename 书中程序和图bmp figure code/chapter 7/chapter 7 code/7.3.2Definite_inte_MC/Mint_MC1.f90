! ÀýÌâ7.3.5
	program Mint_MC1
	implicit none
	real(8) c,xmax,rand
	integer ix,n,m,j,k
	open(4,file='gama.txt')
	ix=32765
	n=2000
	do m=5,9
	   c=0.0
       do j=1,n
	      xmax = rand(ix)
	      do k=2,m
	        xmax = max(xmax,rand(ix))
          end do
		  c=c+dlog(dabs(m*dlog(xmax)))
	   end do
	   c=c/n
	   write(4,100) m,c
	   write(*,100) m,c
	end do
100 format(2x,'gama(',i2,')=',f18.8)
    end 
	
    real function rand(ix)
    integer i,ix
	i=ix*259
	ix=i-i/32768*32768
	rand = real(ix)/32768.0
	return
	end

    
