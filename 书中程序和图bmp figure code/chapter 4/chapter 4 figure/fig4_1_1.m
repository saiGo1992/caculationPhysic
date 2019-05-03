% dfdx_center
clc; clear all; format long;
N = 64; dx=2*pi/N;
x=0:dx:2*pi;
f = cos(x);
dfdx(2:N)=(f(3:N+1)-f(1:N-1))/(2*dx);
dfdx(1)=2*dfdx(2)-dfdx(3); dfdx(N+1)=2*dfdx(N)-dfdx(N-1);
figure(1);
set(gca,'FontSize',16);
plot(x,dfdx,'r-',x,-sin(x),'bo')
grid on; 
%title('图4.1-1  余弦函数的数值微分');
xlabel('x'); ylabel('y');
