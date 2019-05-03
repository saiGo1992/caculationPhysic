% demo_lagrange_2.m使用lagrange_2插值程序的例子
clear;clc;
x = [-5:1:5]; y =1./(1+x.^2);
x0 = [-5:0.1:5]; y0 = lagrange_2(x,y,x0);
y1 = 1./(1+x0.^2);
figure(1);
set(gca,'FontSize',16);
plot(x,y,'bo',x0,y0,'-r',x0,y1,'--k','Linewidth',2)
legend('插值点','插值曲线','原曲线');
title('图3.1-5 拉格朗日插值的Runge现象');
xlabel('x'); ylabel('y');
