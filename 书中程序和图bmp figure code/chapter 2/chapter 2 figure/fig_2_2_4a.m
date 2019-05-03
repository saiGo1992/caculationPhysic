% 图2.2-4(a) 牛顿迭代法方程求根示意图
clc; clf; clear;
y = inline('x.^3+2*x.^2+3*x-1');
yp = inline('3*x.^2+4*x+3');
x0 = 0.85; y0 = y(x0); y0p=yp(x0);
x1 = x0-y0/y0p; y1 = y(x1); y1p = yp(x1);
x2 = x1-y1/y1p;
xmin = -0.1; xmax = 1; n = 100;
x = linspace(xmin ,xmax-0.1,n);
f = y(x); fmin = min(y(x)); fmax = max(y(x));
xy(xmin,xmax,fmin,fmax-0.3);  % 画坐标系
hold on
plot(x,f,'b','Linewidth',2)
hold on
plot([x0 x1],[y0 0],'r','Linewidth',1) %画切线
plot([x1 x2],[y1 0],'r','Linewidth',1) %画切线

text(0.4,2.5,'y = f(x)','FontSize',16);
text(x0,-0.3,'x_k','FontSize',16);
text(x1+0.05,-0.3,'x_k_+_1','FontSize',16);
text(x2,-0.3,'x_k_+_2','FontSize',16);
text(x2-0.05,0.3,'x^*','FontSize',16);
text(x0+0.05,1.3,'f(x_k)','FontSize',16);
plot([x0 x0],[0 y0],'k:','MarkerSize',16); %画虚线
plot([x1 x1],[0 y1],'k:','MarkerSize',16); %画虚线

%text(xmin-0.2,fmin-0.3,'图2.2-4(a) 牛顿迭代法方程求根示意图','FontSize',16)
axis off;
