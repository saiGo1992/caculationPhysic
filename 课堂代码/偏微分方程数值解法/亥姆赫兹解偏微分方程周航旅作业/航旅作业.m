clc;
clear all;
format long;
f=@(x,y)0;
g=@(x,y)0;

%����߽绮��������
x0=0;
xf=20;
y0=0;
yf=10;
D=[x0 xf y0 yf];
%���廮��������
Mx=50;
My=25;
%����߽纯��
bx0=@(y)100;
bxf=@(y)100;
by0=@(x)0;
byf=@(x)0;

%�����������������
MaxIter=100;
tol=1e-4;
[u,x,y]=Helmholtz(f,g,bx0,bxf,by0,byf,D,Mx,My,tol,MaxIter);
surf(x,y,u);
shading interp;
xlabel('x');ylabel('y');zlabel('u');