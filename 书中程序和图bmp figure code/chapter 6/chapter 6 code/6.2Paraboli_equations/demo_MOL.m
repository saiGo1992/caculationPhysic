function demo_MOL
clc;clear all;format long;
n = 15; dpi=pi/n;
x  = dpi:dpi:pi-dpi;
u  = sin(x);
t=0:0.4:40;
[t u] = ode45(@fun,t,u);
uu(:,2:n)=u(:,1:n-1);
uu(:,1)=0;uu(:,n+1)=0;
x = [0 x pi];[xx yy]=meshgrid(x,t);
set(gca,'fontsize',16);
surf(xx,yy,uu);
xlabel('x');ylabel('t');zlabel('u(x,t)');
title('图6.2-1  MOL方法数值解扩散方程');
end
function y =fun(t,u)
n = 15;
x(1)   = -2*u(1)+u(2);
x(n-1) = u(n-2)-2*u(n-1);
x(2:n-2)=u(1:n-3)-2*u(2:n-2)+u(3:n-1);
y = x';
end