% demo_euler_pc.m
function demo_euler_pc
clc; clear all; format long;
x0 = 0; xn = 1; y0 = 1; n = 10;
[x p y] = euler_pc(@f01,x0,y0,xn,n);
z = sqrt(1+2*x);
figure(1);
set(gca,'FontSize',16);
plot(x,p,'r.',x,y,'b',x,z,'k--'); 
legend('显式方法','预测-校正方法','精确解');
xlabel('x');
ylabel('y');
%title('图5.2-2  例题5.2.2两种方法结果比较');
grid on;
end
