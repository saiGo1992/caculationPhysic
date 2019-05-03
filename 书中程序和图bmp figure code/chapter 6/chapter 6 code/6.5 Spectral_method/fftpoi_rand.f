
!!!!!!!!fftpoi_rand.f90!!!!!!!!!!!
      program fftpoi_rand
! Program to solve the Poisson equation using the MFT method
! Periodic boundary conditions
      parameter( Nmax = 200,Maxp=10000 )
      real L,x(Nmax),y(Nmax),rho(Nmax,Nmax),phi(Nmax,Nmax)
      real cx(Nmax),cy(Nmax),P(Nmax,Nmax),xd(Maxp),yd(Maxp)
      complex rhoT(Nmax,Nmax),phiT(Nmax,Nmax)

      pi = 4*atan(1.) ! = 3.14159...
      eps = 1.e-15    ! A tiny number
      eps0 = 8.8542e-12    ! Permittivity of free space (C^2/(N m^2))
      npow = 5        ! Must use a power of 2 for FFT routine
      N = 2**npow     ! Number of grid points on a side
      L = 1.          ! System size
      h = L/N         ! Grid spacing (periodic boundaries)
      do i=1,N
        x(i) = (i-0.5)*h  ! x-components of grid points
        y(i) = x(i)       ! y-components of grid points (square geom.)
      end do
      write (*,*) 'System is a square of length ',L
      ! Set up the charge density rho(i,j)
      do i=1,N
       do j=1,N
        rho(i,j) = 0.
       end do
      end do
      write (*,*) 'Enter number of charges'
      read (*,*) M
!	q=9.1e-9
      q = 1.0
      do i=1,M
      CALL RANDOM(RANUM)
	rx=ranum
	CALL RANDOM(RANUM)
	ry=ranum
	CALL RANDOM(RANUM)
	nq=(-1)**int(ranum+0.5)
!        write (*,*) 'For # ',i,' enter x,y coordinates and charge'
!        read (*,*) rx,ry,q
        ii = int(rx/h+0.5) + 1     ! Place charge at nearest 
        jj = int(ry/h+0.5) + 1     ! grid point
        rho(ii,jj) = rho(ii,jj) + q*nq
      end do
      write (*,*) 'Computing matrix P'
      coeff = 2*pi/N
      do i=1,N
        cx(i) = cos(coeff*(i-1))  ! Used to compute matrix P
        cy(i) = cx(i)             ! Used to compute matrix P
      end do
      temp = -h**2/(2*eps0)
      do i=1,N    ! Compute the matrix P
       do j=1,N
        P(i,j) = temp/((cx(i)+cy(j)-2)+eps)
       end do
      end do
      P(1,1) = 0. ! Clean up the divide by zero
      write (*,*) 'Computing potential'
      do i=1,N
       do j=1,N
        rhoT(i,j) = rho(i,j)   ! Copy values into rhoT
       end do
      end do
      call fft2(rhoT,npow,Nmax) ! Take 2D transform
      do i=1,N
       do j=1,N
        phiT(i,j) = rhoT(i,j)*P(i,j)  ! Compute phi in the
       end do                         ! frequency domain
      end do
      call ifft2(phiT,npow,Nmax)      ! Inv. transform into
      do i=1,N                        ! the real (space) domain
       do j=1,N
        phi(i,j) = real(phiT(i,j))    ! Copy into phi
       end do
      end do
! Print out the plotting variables -
!   x,y,rho,phi
! 
      open(11,file='x.txt')
      open(12,file='y.txt')
      open(13,file='rho.txt')
      open(14,file='phi.txt')
      do i=1,N
        write (11,1001) x(i)
        write (12,1001) y(i)
	  do j=1,N
          write (13,1002) rho(i,j)
          write (14,1002) phi(i,j)
	  end do
          write (13,1003) 
          write (14,1003) 
      end do
      stop
 1001 format(e12.6)
 1002 format(e12.6,' ',$)
 1003 format(/) 
      end

	  subroutine fft2(A,npow,NA)
! Routine to compute the two dimensional Fourier transform
! Uses the fft routine
      parameter( Nmax = 1024 )  ! Maximum number of data points
      complex A(NA,NA), Atemp(Nmax)

      N = 2**npow    ! Number of data points
      do j=1,N
        do i=1,N
          Atemp(i) = A(i,j)   ! Copy out a column
        end do
        call fft(Atemp,npow)  ! Take its transform
        do i=1,N
          A(i,j) = Atemp(i)   ! Copy it back in
        end do
      end do

      do i=1,N
        do j=1,N
          Atemp(j) = A(i,j)   ! Copy out a row
        end do
        call fft(Atemp,npow)  ! Take its transform
        do j=1,N
          A(i,j) = Atemp(j)   ! Copy it back in
        end do
      end do

      return
      end
     
	  subroutine ifft2(A,npow,NA)
! Routine to compute the two dimensional inverse Fourier transform
! Uses the fft routine 
      parameter( Nmax = 4096 )  ! Maximum number of data points
      complex A(NA,NA), Atemp(Nmax)

      N = 2**npow    ! Number of data points
      do j=1,N
        do i=1,N
          Atemp(i) = conjg(A(i,j))   ! Copy out a column
        end do
        call fft(Atemp,npow)  ! Take its transform
        do i=1,N
          A(i,j) = Atemp(i)   ! Copy it back in
        end do
      end do

      do i=1,N
        do j=1,N
          Atemp(j) = A(i,j)   ! Copy out a row
        end do
        call fft(Atemp,npow)  ! Take its transform
        do j=1,N
          A(i,j) = conjg(Atemp(j))/N**2   ! Copy it back in
        end do
      end do

      return
      end
     

	   subroutine fft(A,M)
! Routine to compute discrete Fourier transform using FFT algorithm
! The complex vector A contains a data vector with 2**M points
! On output the vector A contains the transform of the input
      complex A(*), u, w, temp

      Pi = 4.*atan(1.)
      N = 2**M        ! Number of data points
      N_half = N/2
      Nm1 = N-1

      j=1
      do i=1,Nm1
        if( i .lt. j ) then
          temp = A(j)
          A(j) = A(i)
          A(i) = temp
        end if
        k = N_half
 1      if( k .ge. j ) goto 2  ! while loop
          j=j-k
          k=k/2
          goto 1
 2      continue
        j = j+k
      end do

      do k=1,M
        ke = 2**k
        ke1 = ke/2
        u = (1.0, 0.0)
        angle = -Pi/ke1
        w = cmplx(cos(angle),sin(angle))
        do j=1,ke1
          do i=j,N,ke
            ip = i + ke1
            temp = A(ip)*u
            A(ip) = A(i)-temp
            A(i) = A(i)+temp
          end do
          u = u*w
        end do
      end do

      return
      end



      

