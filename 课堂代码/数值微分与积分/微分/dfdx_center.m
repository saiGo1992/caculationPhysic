%采用中心差商求余弦函数得数值微分。
%dfdx_center
clc;
clear all; 
format long;
N=64;dx=2*pi/N;
x=0:dx:2*pi; %x取步进为1/32*pi，生成一个行向量
f=5*x^2; %f为一个一行多列的行向量，列数和x的列数一样
dfdx(2:N)=(f(3:N+1)-f(1:N-1))/(2*dx); %知道1到N离散的函数值，可以求这些离散点中2到N-1的导数，每一个点的导数值等于后一个点函数值减去前一个点函数值除以2倍步进
dfdx(1)=2*dfdx(2)-dfdx(3); %第一个值的导数等于2倍第二个减去第三个（为什么？）
dfdx(N+1)=2*dfdx(N)-dfdx(N-1); %最后一个值的导数等于2倍倒数第二个减去倒数第三个（为什么？）
figure(1);
set(gca, 'FontSize',16);
plot(x, dfdx, 'r-', x, 10*x, 'bo');
grid on;
title('余弦函数的数值分析');
xlabel ('x'); 
ylabel('y');
