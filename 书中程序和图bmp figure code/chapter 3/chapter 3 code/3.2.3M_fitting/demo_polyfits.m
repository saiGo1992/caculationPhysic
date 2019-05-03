% demo_polyfits
clc;clear all;
format long;
x =-1:0.2:1;
y = exp(x);
m = 5;
a = polyfits(x,y,m)
c =[a(6) a(5) a(4) a(3) a(2) a(1)];
x1=-1:0.02:1;
y1=polyval(c,x1);
plot(x1,y1,'r',x,y,'o');
title('5 次多项式拟合 exp(x)','FontSize',14);
xlabel('x','FontSize',14);
ylabel('y','FontSize',14);
gtext(datestr(today));




