!例题3.2.3    	
	program polyfit
!     多项式拟合
	implicit none
	integer n,m,i,l,k,j
	parameter (n=11,m=6,k=21)
      real, dimension (n):: x,y
	real, dimension (k):: xn,yn,xo,yo
      real s(m,m),t(m),js(m),z(m),dx
	open(5,file='exa3_2_3.dat')
      open(2,file='exa3_2_3_old.dat')
      data x/-1.0,-0.8,-0.6,-0.4,-0.2,0.0,0.2,0.4,0.6,0.8,1.0/
	do i=1,n
	   y(i)=exp(x(i))
	end do
	call fitp(n,m,x,y,s,t)
      call gaus(s,t,m,z,l,js)
	
	if (l.ne.0) then
	  write(*,10) (i,z(i),i=1,6)
	end if
10	format(1x,'x(',i2,' )=',d15.6)
      dx=2.0/(k-1)
	do i=1,k
	  xn(i)=-1.0+dx*(i-1)
	  xo(i)=xn(i)
	  yo(i)=exp(xo(i))
	  yn(i)=z(m)
        do j=1,m-1
	    yn(i)=yn(i)*xn(i)+z(m-j)
	  end do
        write(5,'(2f14.6)') xn(i),yn(i)
        write(2,'(2f14.6)') xo(i),yo(i)
	end do
	end
	
	subroutine fitp(n,m1,x,y,s,t)
	implicit none
	integer n,m1,m,j,i,i1,mi
	real, dimension (n):: x,y
      real s(m1,m1),t(m1)
	m=m1-1
	s=0.0
	t=0.0
	s(1,1)=n
	do j=1,n
	   t(1)=t(1)+y(j)
	end do
	do i=2,m1
	   i1=i-1
	   mi=m1+i-2
	   do j=1,n
	      s(i,1)=s(i,1)+x(j)**i1
		  s(m1,i)=s(m1,i)+x(j)**mi
		  t(i)=t(i)+x(j)**i1*y(j)
	  end do
	end do
	do j=2,m
	  do i=j,m
	     s(i,j)=s(i+1,j-1)
	  end do
	end do
	do i=1,m
	   i1=i+1
	   do j=i1,m1
	      s(i,j)=s(j,i)
       end do
	end do
	return
	end

     	subroutine gaus(a,b,n,x,l,js)
	real a(n,n),x(n),b(n),js(n)
	real t
	l=1
	do 50 k=1,n-1
	  d=0.0
	  do 210 i=k,n
	  do 210 j=k,n
	    if (abs(a(i,j)).gt.d) then
	      d=abs(a(i,j))
	      js(k)=j
	      is=i
	    end if
210	  continue
	  if (d+1.0.eq.1.0) then
	    l=0
	  else
	    if (js(k).ne.k) then
	      do 220 i=1,n
	        t=a(i,k)
	        a(i,k)=a(i,js(k))
	        a(i,js(k))=t
220	      continue
	    end if
	    if (is.ne.k) then
	      do 230 j=k,n
	        t=a(k,j)
	        a(k,j)=a(is,j)
	        a(is,j)=t
230	      continue
	      t=b(k)
	      b(k)=b(is)
	      b(is)=t
	    end if
	  end if
	  if (l.eq.0) then
	    write(*,100)
	    return
	  end if
	  do 10 j=k+1,n
	    a(k,j)=a(k,j)/a(k,k)
10	  continue
	  b(k)=b(k)/a(k,k)
	  do 30 i=k+1,n
	    do 20 j=k+1,n
	      a(i,j)=a(i,j)-a(i,k)*a(k,j)
20	    continue
	    b(i)=b(i)-a(i,k)*b(k)
30	  continue
50	continue
	if (abs(a(n,n))+1.0.eq.1.0) then
	  l=0
	  write(*,100)
	  return
	end if
	x(n)=b(n)/a(n,n)
	do 70 i=n-1,1,-1
	  t=0.0
	  do 60 j=i+1,n
	    t=t+a(i,j)*x(j)
60	  continue
	  x(i)=b(i)-t
70	continue
100	format(1x,' fail ')
	js(n)=n
	do 150 k=n,1,-1
	  if (js(k).ne.k) then
	    t=x(k)
	    x(k)=x(js(k))
	    x(js(k))=t
	  end if
150	continue
	return
	end

