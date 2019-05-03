% rectangle.m
%这三种情况其实都是把被积分的区间分成若干等间距矩阵，区别在于矩阵的高一个取区间左边界的值，一个取区间右边界的值，一个取区间中点的值
clc; clear all; format long;
n=8;
for k=1:n;
      dx=pi/k;
      x=0:dx:pi;
      xm=dx/2:dx:pi-dx/2;
      f=sin(x);
      fm=sin(xm);
      I1(k)=sum(f(1:k))*dx;
      Ir(k)= sum(f(2:k+1))*dx;
      Im(k)=sum(fm)*dx;
end
figure(1);
set(gca,'FontSize',16);
plot(1:n,I1,'r-',1:n,Ir,'bo',1:n,Im,'k--','linewidth',2);
xlabel('网格线'); ylabel('积分值');
legend('左矩形','右矩形','中点公式');
title('三种求积公式结果比较');
grid on;
