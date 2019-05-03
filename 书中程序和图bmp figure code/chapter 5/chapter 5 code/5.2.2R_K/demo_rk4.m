function demo_rk4
clc; clf; clear all
n = 11 ; a = 2 ; b = 3; y(1) = 4 ;        
h = (b-a)/n ; x = a:h:b;
y  = rk4(@f02,a,b,y(1),n);
xe = linspace(a,b,100);
ye = (1+0.25*xe.*xe).^2;
figure(1);
set(gca,'FontSize',16);
plot(xe,ye,'-',x,y,'o','LineWidth',2); 
xlabel('x');ylabel('y');
title('图5.2-3  4阶Runge-Kutta方法求解 dy/dx = xy^1^/^2');
legend('精确解','数值解');
grid on;

