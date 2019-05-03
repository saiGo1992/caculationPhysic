% rectangle.m
clc; clear all; format long;
n = 8;
for k = 1:n;
    dx = pi/k;
    x = 0:dx:pi;
    xm = dx/2:dx:pi-dx/2; 
    f = sin(x); fm = sin(xm);
    Il(k) = sum(f(1:k))*dx;
    Ir(k) = sum(f(2:k+1))*dx;
    Im(k) = sum(fm)*dx;
end
figure(1);
set(gca,'FontSize',16);
plot(1:n,Il,'r-',1:n,Ir,'ko',1:n,Im,'b-','linewidth',2);
xlabel('网格数');ylabel('积分值');
legend('左距形','右矩形','中点公式');
title('图4.2-3  例题4.2.4三种求积公式结果比较');
grid on;