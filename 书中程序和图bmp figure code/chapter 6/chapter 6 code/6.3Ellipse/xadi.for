  !!!!xadi.f!!!!!
      program 
      use AVDef
	use DFLib
	parameter(n=19)
	real ai(n),bi(n),ci(n),r(n),u(n)
	real aj(n),bj(n),cj(n)
      integer status
	real T(0:n,0:n),TT(0:n,0:n)
	real lamda,Tu,Td,Tl,Tr,dx,dy,dt,ka
	open(2,file='T3.dat')
	Tu=100.;Tl=75.;Tr=50.;Td=0.;dx=1.;dy=1.;kmax=10;dt=1.
	ka=0.835; lamda=ka*dt/(dx*dx)
	write(*,*) 'lamda=',lamda
      T = 0.
	T(0,:) = Tl;  T(n,:) =Tr
      T(:,0) = Td;  T(:,n) =Tu
	T(0,0)=0.5*(Td+Tl);T(0,n)=0.5*(Tl+Tu)
	T(n,n)=0.5*(Tu+Tr);T(n,0)=0.5*(Tr+Td)
      ! 系数矩阵赋值
	aj(:)=-lamda;         ai(:)=lamda
	bj(:)= 2.*(1.+lamda); bi(:)=2.*(1-lamda)
	cj(:)=-lamda;	      ci(:)=lamda
      call faglStartWatch(T, status)
!    相当于随时间演化	
	do k=1,kmax
	   do i=1,n-1
            do j=1,n-1
	         r(j)=ai(i)*T(i-1,j)+bi(i)*T(i,j)+ci(i)*T(i+1,j)
	      end do
	      r(1)=r(1)-aj(1)*T(i,0)
	      r(n-1)=r(n-1)-cj(n-1)*T(i,n)
	      call tridag(aj,bj,cj,r,u,n-1)
	      do j=1,n-1 
	         T(i,j)=u(j)
	      end do
	   end do
	   ! 将矩阵T转置计算x方向 
	   call reverse(n,T,TT)
         do i=1,n-1
            do j=1,n-1
	         r(j)=ai(i)*TT(i-1,j)+bi(i)*TT(i,j)+ci(i)*TT(i+1,j)
	      end do
	      r(1)=r(1)-aj(1)*TT(i,0)
	      r(n-1)=r(n-1)-cj(n-1)*TT(i,n)
	      call tridag(aj,bj,cj,r,u,n-1)
	      do j=1,n-1 
	         TT(i,j)=u(j)
	      end do
	   end do
         call reverse(n,TT,T)
         call faglUpdate(T, status)
	   call faglShow(T, status)
      end do
	pause
	call faglClose(T, status)
      call faglEndWatch(T, status)
	do j=0,n
	  write(2,222)  (T(i,j),i=0,n)
	end do
222	format(1x,20(2x,f14.10))
	end

	SUBROUTINE tridag(a,b,c,r,u,n)
      INTEGER n,NMAX
      REAL a(n),b(n),c(n),r(n),u(n)
      PARAMETER (NMAX=500)
      INTEGER j
      REAL bet,gam(NMAX)
      if(b(1).eq.0.)pause 'tridag: rewrite equations'
      bet=b(1)
      u(1)=r(1)/bet
      do 11 j=2,n
        gam(j)=c(j-1)/bet
        bet=b(j)-a(j)*gam(j)
        if(bet.eq.0.)pause 'tridag failed'
        u(j)=(r(j)-a(j)*u(j-1))/bet
11    continue
      do 12 j=n-1,1,-1
        u(j)=u(j)-gam(j+1)*u(j+1)
12    continue
      return
      END

      SUBROUTINE REVERSE(n,T,TT)
	integer n,i,j
	real T(0:n,0:n),TT(0:n,0:n)
      do i=0,n
	   do j=0,n
	      TT(i,j)=T(j,i)
	   end do
	end do
	return
	end
