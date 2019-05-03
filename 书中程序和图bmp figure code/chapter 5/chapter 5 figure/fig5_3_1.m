% demo_bvp1_tri.m   三对角矩阵追赶法
function demo_bvp1_tri
clc; clear all; format long;
x1 = 2; xn = 3; n = 100;
y1 = 0; yn = 0;
h = (xn-x1)/(n-1); x = x1:h:xn;
u(1:n) = -1; v(1:n) = 0; w(1:n) = 2./x(:)./x(:); f(1:n) = 1./x(:);
y = bvp1_tri(u,v,w,f,x,y1,yn,n);
figure(1);
set(gca,'FontSize',16);
plot(x,y,'LineWidth',2);grid on;
xlabel('x');
ylabel('y');
%title('图5.3-1  例题5.3.1的函数图像');
end


function y = bvp1_tri(u,v,w,f,x,y1,yn,n)
h = (x(n)-x(1))/(n-1);
a(1:n) = u(1:n)-0.5*h*v(1:n);
b(1:n) = h*h*w(1:n)-2*u(1:n);
c(1:n) = u(1:n)+0.5*h*v(1:n);
d(1:n) = h*h*f(1:n);
a(1)=0;b(1)=1;c(1)=0;d(1)=y1;
a(n)=0;b(n)=1;c(n)=0;d(n)=yn;
y = tri(a,b,c,d);
end


