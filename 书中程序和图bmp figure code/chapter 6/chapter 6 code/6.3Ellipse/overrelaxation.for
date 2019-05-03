! program overrelaxation.for
! overrelaxation_iteration_methods for finite diffrence
! of the 2d_Laplacian difference equation
	parameter(imax=25,jmax=25,pi=3.1415926)
	dimension T(imax,jmax),a(imax,jmax),
     &  qx(imax,jmax),qy(imax,jmax),q(imax,jmax),an(imax,jmax)
	real lamda,Tu,Td,Tl,Tr,kpx,kpy,dx,dy
	open(2,file='overrelaxation.dat')
	open(3,file='q.dat')
	lamda=1.5;Tu=100.;Tl=75.;Tr=50.;Td=0.;dx=1.;dy=1.;kmax=9
	kpx=-0.49/2./dx;kpy=-0.49/2./dy
	do i=1,imax
	   do j=1,jmax
	      T(i,j)=0.0
	   end do
	end do
	T(1,1)=0.5*(Td+Tl)      ;T(1,jmax)=0.5*(Tl+Tu)
	T(imax,jmax)=0.5*(Tu+Tr);T(imax,1)=0.5*(Tr+Td)
	do j=2,jmax-1
	  T(1,j)=Tl; T(imax,j)=Tr
	end do
	do i=2,	imax-1
	  T(i,1)=Td;  T(i,jmax)=Tu
	end do
	k=0
5     k=k+1
	do i=2,imax-1
	   do j=2,jmax-1
	      a(i,j)=T(i,j)
	      T(i,j)=0.25*(T(i+1,j)+T(i-1,j)+T(i,j+1)+T(i,j-1))
	      T(i,j)=lamda*T(i,j)+(1.-lamda)*a(i,j)
	   end do    
	end do
	ep=abs((T(2,2)-a(2,2))/T(2,2))
	if(k.lt.kmax) goto 5
	write(*,*) 'ep=',ep
	do j=1,jmax
	  write(2,222)  (T(i,j),i=1,imax)
	end do
222	format(1x,25(2x,f14.10))
	do i=2,imax-1
	   do j=2,jmax-1
	      qx(i,j)=kpx*(T(i+1,j)-T(i-1,j))
		  qy(i,j)=kpy*(T(i,j+1)-T(i,j-1))
	      q(i,j)=sqrt(qx(i,j)*qx(i,j)+qy(i,j)*qy(i,j))
		  if(qx(i,j).gt.0.) then
		    an(i,j)=atan(qy(i,j)/qx(i,j))
		  else
		    an(i,j)=atan(qy(i,j)/qx(i,j))+pi
		  end if
	   end do    
	end do
	do j=2,jmax-1
	   do i=2,imax-1
!	      write(3,333) dx*(i-1),dy*(j-1),an(i,j),q(i,j)
            write(3,333) dx*(i-1),dy*(j-1),qx(i,j),qy(i,j)
	   end do
	end do
333   format(1x,4(2x,f18.12))
	end

