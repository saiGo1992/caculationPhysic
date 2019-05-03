% demo_sp3.m
clc;clear all;format long;
x = [-1.:0.1:1.]; y = 1./(1.+x.*x);
n = length(x);
[c1 c2 c3 c4] = sp3(x,y);
dx = x(2)-x(1)
m = 10*n;
dz = (x(n)-x(1))/(m-1)
for k = 1:m-1
    zs(k) = dz*(k-1);    
    j = floor(zs(k)/dx)+1; % 计算出要计算点所在的样条位置
    z(k) = zs(k)+x(1);
    s(k) = c1(j)*z(k)*z(k)*z(k)/6.+c2(j)*z(k)*z(k)/2.+c3(j)*z(k)+c4(j);
    sp(k) = c1(j)*z(k)*z(k)/2.+c2(j)*z(k)+c3(j);
    spp(k) = c1(j)*z(k)+c2(j);
end
yy = 1./(1+z.*z);
figure(1);
set(gca,'FontSize',16);
plot(z,yy,'k',x,y,'bo',z,s,'r','LineWidth',2)
xlabel('x');
ylabel('y')
legend('原曲线','插值点','插值曲线');
title('图3.1-6  y=1/(1+x^2):样条插值'); 
grid on;
