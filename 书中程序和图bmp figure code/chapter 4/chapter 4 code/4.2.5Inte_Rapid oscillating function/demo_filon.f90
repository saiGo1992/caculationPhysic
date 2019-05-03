program demo_filon
implicit none
integer, parameter :: nd = 401
integer :: n,nre
real(8) :: x(401),f(401),si(401),cs(401)
real(8) :: a,b,ck,s,c
a  = 0.0
b  = 200.0
n  = 200
nre= 401
ck = 100.0
call filon(a,b,nre,ck,x,si,cs,s,c)
write(*,*) 'c=',c, '  s=',s
end
	
function fx(x)
real(8) :: x,fx
fx=exp(-x)
return
end
	
subroutine filon(a,b,nre,ck,x,si,cs,s,c)
implicit none
integer :: nr,i,nre
real(8) :: x(nre),f(nre),si(nre),cs(nre),fx
real(8) :: h,a,b,o,sn1,sn2,cn1,cn2,op,rf,bt,gm,s,c
real(8) :: ck,xk
nr=nre-1
h=(b-a)/nr
o=ck*h
do i=1,nre
 x(i)=a+(i-1)*h
 xk=ck*x(i)
 si(i)=sin(xk)
 cs(i)=cos(xk)
 f(i)=fx(x(i))
end do
sn1=0.
sn2=0.
cn1=0.
cn2=0.
do i=1,nre,2
 sn2=sn2+f(i)*si(i)
 cn2=cn2+f(i)*cs(i)
end do
sn2=sn2-0.5*(f(1)*si(1)+f(nre)*si(nre))
cn2=cn2-0.5*(f(1)*cs(1)+f(nre)*cs(nre))
do i=2,nr,2
 sn1=sn1+f(i)*si(i)
 cn1=cn1+f(i)*cs(i)
end do
op=o*o
if(o<=0.16666667) then
 rf=((op/4725.-1./315.)*op+1./45.)*op*o*2.
 bt=((((-2.*op/22275.+1./567.)*op-2./105.)*op+1./15.)*op+1./3.)*2.
 gm=((-op/11340.+1./210.)*op-2./15.)*op+4./3.
else 
 rf=((-2.*sin(o)**2/o+sin(o+o)/2.)/o+1.)/o
 bt=(-sin(o+o)/o+1.+cos(o)**2)/op*2.
 gm=(sin(o)/o-cos(o))/op*4.
end if
s=h*(rf*(f(1)*cs(1)-f(nre)*cs(nre))+bt*sn2+gm*sn1)
c=h*(rf*(f(nre)*si(nre)-f(1)*si(1))+bt*cn2+gm*cn1)
return
end
