!      program Walk_MC1.for
! 蒙特卡罗方法求解 2d_Laplacian difference equation
	parameter(imax=50,jmax=50,pi=3.1415926,kmax=10000)
	dimension T(imax,jmax),a(imax,jmax),
     &  qx(imax,jmax),qy(imax,jmax),q(imax,jmax),an(imax,jmax)
	real lamda,Tu,Td,Tl,Tr,kpx,kpy,dx,dy,r
	open(2,file='walk2.dat')
	open(3,file='q2.dat')
	lamda=1.5;Tu=100.;Tl=75.;Tr=50.;Td=0.;dx=0.1;dy=0.1;ix=32765
	kpx=-0.49/2./dx;kpy=-0.49/2./dy
	T(:,:)=0.0
	T(1,1)=0.5*(Td+Tl)      ;T(1,jmax)=0.5*(Tl+Tu)
	T(imax,jmax)=0.5*(Tu+Tr);T(imax,1)=0.5*(Tr+Td)
	T(1,2:jmax-1)=Tl; T(imax,2:jmax-1)=Tr
      T(2:imax-1,1)=Td;  T(2:imax-1,jmax)=Tu
	do i=2,imax-1
	   print *,'i=',i
	   ii=i
	   do j=2,jmax-1
	      jj=j
            do 20 k=1,kmax
		     a(i,j)=T(i,j)
6	         call rand(ix,r)
		       if(r.le.0.25) then 
			   ii=ii+1
	         else
	           if(r.le.0.5) then
                   jj=jj-1
                 else
	             if(r.le.0.75) then
	               ii=ii-1
	             else
	               jj=jj+1
                   end if
	           end if
	         end if
               if(ii.eq.1.or.ii.eq.imax) goto 18
	         if(jj.eq.1.or.jj.eq.jmax) goto 19
	         goto 6
18            T(i,j)=T(ii,j)
              goto 17
19           T(i,j)=T(i,jj)
17	       T(i,j)=a(i,j)+T(i,j)
20	       continue
	       T(i,j)=T(i,j)/float(kmax)
          end do
	end do

	do j=1,jmax
	  write(2,222)  (T(i,j),i=1,imax)
	end do
222	format(1x,50(2x,f14.10))
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

      subroutine rand(ix,r)
	i=ix*259
	ix=i-i/32768*32768
	r=float(ix)/32768
	return
	end
