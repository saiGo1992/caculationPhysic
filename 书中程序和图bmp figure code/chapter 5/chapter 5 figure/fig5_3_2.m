% demo_bvp2_tri.m   三对角矩阵追赶法
function demo_bvp2_tri
clc; clear all; format long;
x1 = 0; xn = 2; n = 100;
y1 = 0; ynp = 0;
h = (xn-x1)/(n-1); x = x1:h:xn;
u(1:n) = 1; v(1:n) = 0; w(1:n) = 9.; f(1:n) = x(:);
y = bvp2_tri(u,v,w,f,x,y1,ynp,n);
figure(1);
set(gca,'FontSize',16);
plot(x,y,'LineWidth',2);grid on;
%title('图5.3-2  例题5.3.2的函数图像');
xlabel('x'); ylabel('y');
end


function y = bvp2_tri(u,v,w,f,x,y1,ynp,n)
h = (x(n)-x(1))/(n-1);
a(1:n) = u(1:n)-0.5*h*v(1:n);
b(1:n) = h*h*w(1:n)-2*u(1:n);
c(1:n) = u(1:n)+0.5*h*v(1:n);
d(1:n) = h*h*f(1:n);
a(1)=0;b(1)=1;c(1)=0;d(1)=y1;
a(n)=-1;b(n)=1;c(n)=0;d(n)=ynp*h;
y = tri(a,b,c,d);
end


