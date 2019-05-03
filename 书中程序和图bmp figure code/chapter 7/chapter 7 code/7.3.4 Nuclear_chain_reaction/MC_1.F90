program mc_1
implicit none
integer i,j,k,nmax,kmax
real(8) x,n,m,dm,t,pi,a,b,nin,rand,f,xi(50),fi(50)
real(8) r(9),x0,y0,z0,x1,y1,z1,p,c,s,d
open(2,file='k_m.txt')
x = 1.0 ;n = 10000.0; m = 0.98
dm= 0.02; t = 1.0; pi= 3.14159265
nmax=n; kmax=50
do k=1,kmax
   m=m+dm
   xi(k)=m
   a = (m*t)**(1.0/3.0)
   b = (m/(t*t))**(1.0/3.0)
   nin=0.0
   do j=1,nmax
      do i=1,9
         r(i)=rand(x)
      end do
      x0=a*(r(1)-0.5)
      y0=a*(r(2)-0.5)
      z0=b*(r(3)-0.5)
      do 1 i=1,2
         p=2.0*pi*r(2*i+2)
	     c=2.0*(r(2*i+3)-0.5)
	     s=sqrt(1.0-c*c)
	     d=r(i+7)
	     x1=x0+d*s*cos(p)
	     y1=y0+d*s*sin(p)
	     z1=z0+d*c
	     if(abs(x1).gt.0.5*a) goto 1
	     if(abs(y1).gt.0.5*a) goto 1
	     if(abs(z1).gt.0.5*b) goto 1
	     nin=nin+1.0
1     continue
   end do
   f=nin/n
   fi(k)=f
   write(2,'(5x,d13.8,5x,d13.8)') m,f
end do
end program mc_1




real function rand(x)
	real(8) s,u,v,x
	s=65536.0
	u=2053.0
	v=13849.0
	m=x/s
	x=x-m*s
	x=u*x+v
	m=x/s
	x=x-m*s
	rand=x/s
	return
	end