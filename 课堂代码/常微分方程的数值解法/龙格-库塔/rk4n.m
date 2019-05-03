%核心:方程组也可以把每一个方程都用4级4阶龙哥库塔
function y=rk4n(deriv,n, x, dx, y)      %计算从x到x+dx一个步长y(x+dx)
    x0=x;y0=y;
    %dy1其实就是rk4(4级4阶龙格-库塔)中的k1,0.5*dx*dy1(1:n)就是h*k1/2用于计算k2
    dy1=feval(deriv,x0, y);
    y(1:n)=y0(1:n)+0.5*dx*dy1(1:n);
    
    %dy2其实就是rk4(4级4阶龙格-库塔)中的k2,0.5*dx*dy2(1:n);就是h*k2/2用于计算k3
    dy2=feval(deriv,x0+0.5*dx, y);
    y(1:n)=y0(1:n)+0.5*dx*dy2(1:n);
    
    %dy3其实就是rk4(4级4阶龙格-库塔)中的k3,0.5*dx*dy2(1:n);就是h*k3用于计算k4
    dy3=feval(deriv,x0+0.5*dx, y);
    y(1:n)=y0(1:n)+dx*dy3(1:n);
    
    %dy3其实就是rk4(4级4阶龙格-库塔)中的k4
    dy4=feval(deriv,x0+dx, y);
    
    %(dy1(1:n)+2*(dy2(1:n)+dy3(1:n))+dy4(1:n))/6 即 (k1+2k2+2k3+k4)/6
    dy(1:n)=(dy1(1:n)+2*(dy2(1:n)+dy3(1:n))+dy4(1:n))/6;
    
    %即y_n+1=y_n+h(k1+2k2+2k3+k4)/6
    y(1:n)=y0(1:n)+dx*dy(1:n);

% function dy = dfun(t,y)
% dy = [y(4),y(5),y(6),y(5),-y(4),0];
% end
% 
% clear all;clc;
% format long;
% n=6;t0=0;dt=0.1;
% y=[ 1 1 0 1 0 1];
% for i=1:500
%          t(i)=t0+(i-1)*dt;
%          y=rk4n(@dfun,n,t(i),dt,y);
%          y1(i)=y(1); y2(i)=y(2);y3(i)=y(3);
% end
% figure(1);
% set (gca, 'FontSize',16);
% plot3(y1,y2,y3,'LineWidth',2);
% xlabel('x(t)');
% ylabel('y(t)');
% zlabel('z(t)');
% grid on;

