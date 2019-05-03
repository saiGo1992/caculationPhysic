clc;clear all;
L = 15;dx = 0.1;dt = 0.05;a = -1.;
x =[-L+dx:dx:0]';n=length(x);
%Initial value
u1=zeros(1,n-20);u2=ones(1,10);u3 = zeros(1,10);
u = [u1 u2 u3]';r = a*dt/dx; u0 = u;
figure(1);
set(gca,'FontSize',16);
plot(x,u','LineWidth',2);axis([-15 0 -1 2]);
for t=dt:dt:10.
     u(1:n-1) = (1+r)*u(1:n-1)-r*u(2:n);            % Upwind_Method
    % u(2:n-1)=0.5*((1.-r)*u(3:n) +(1.+r)*u(1:n-2)); % Lax scheme
    hold off;plot(x,u,'LineWidth',2);
    axis([-15 0 -1 2]);pause(0.05)
 end
hold on; plot(x,u0','r','LineWidth',2);axis([-15 0 -1 2]);
xlabel('x');ylabel('u(x,t)');
legend('传播的波','初始方波');
grid on;
title('图6.1-2  例题6.1.1波传播示意图')

