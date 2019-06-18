clc;
clear all;
format long;
f=@(x,y)0;
g=@(x,y)0;

%定义边界划分网格数
x0=0;
xf=20;
y0=0;
yf=10;
D=[x0 xf y0 yf];
%定义划分网格数
Mx=50;
My=25;
%定义边界函数
bx0=@(y)100;
bxf=@(y)100;
by0=@(x)0;
byf=@(x)0;

%迭代次数与容忍误差
MaxIter=100;
tol=1e-4;
[u,x,y]=Helmholtz(f,g,bx0,bxf,by0,byf,D,Mx,My,tol,MaxIter);
surf(x,y,u);
shading interp;
xlabel('x');ylabel('y');zlabel('u');