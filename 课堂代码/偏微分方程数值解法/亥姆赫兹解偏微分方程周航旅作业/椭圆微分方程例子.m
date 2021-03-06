clc;clear all;
format long;
f=inline('x^2+y^2','x','y');
g=inline('sqrt(x)','x','y');
x0=0;xf=4;y0=0;yf=4;
Mx=30;My=30;
bx0=inline('y^2','y');
bxf=inline('16*cos(y)','y');
by0=inline('x^2','x');
byf=inline('16*cos(x)','x');
D=[x0 xf y0 yf];
MaxIter=100;
tol=1e-4;
[u,x,y]=Helmholtz(f,g,bx0,bxf,by0,byf,D,Mx,My,tol,MaxIter);
surf(x,y,u);
shading interp;
set(gca,'fontsize',16);