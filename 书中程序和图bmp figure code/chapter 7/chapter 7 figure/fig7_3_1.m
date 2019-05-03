% 图7.3.3 积分示意图
clc; clf; clear;
y = inline('sin(x)+0.1');
w = inline('(x-a).*(x-b)','x','a','b');
x0 = 0.1*pi; y0 = y(x0); x1 = 0.9*pi; y1 = y(x1); xc = (x0+x1)/2; yc = y(xc);
xmin = -0.1; xmax = pi; 
x = xmin:0.002:xmax;
f = y(x); fmin = min(y(x)); fmax = max(y(x));
xy(xmin,xmax,fmin-0.3,fmax);  % 画坐标系
hold on
xx =x0:(x1-x0)/30:x1;
ff = y(xx);
figure(1);
set(gca,'FontSize',16);
plot(xx,ff,'b','Linewidth',2)
hold on
text(0.5,1.0,'f(x)','FontSize',16);
text(-0.6,yc,'f(x_m)','FontSize',16);
text(x0,-0.1,'a','FontSize',16);
text(x1,-0.1,'b','FontSize',16);
plot([x0 x0],[0 yc],'k:','MarkerSize',16); %画虚线
plot([x1 x1],[0 yc],'k:','MarkerSize',16); %画虚线
plot([0 x1],[yc yc],'k:','MarkerSize',16); %画虚线

x = x0:0.001:x1;
l0 = w(x,xc,x1)./w(x0,xc,x1); lc = w(x,x0,x1)./w(xc,x0,x1); l1 = w(x,x0,xc)./w(x1,x0,xc);
p = l0*y0+lc*yc+l1*y1;
fill([x0 x0 x x1 x1],[0 y0 p y1 0],'c');
plot([xc xc],[0 yc],'r','MarkerSize',16); %画虚线
text(xc-0.05,-0.1,'x_m','FontSize',16);
axis off;
%title('图7.3-1  投点法示意图');