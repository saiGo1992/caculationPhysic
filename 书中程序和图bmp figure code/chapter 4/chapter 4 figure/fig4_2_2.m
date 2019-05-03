% 图4.2-2 辛普森积分示意图
clc; clf; clear;
y = inline('x.^3-4*x.^2+3*x+0.5');
w = inline('(x-a).*(x-b)','x','a','b');
x0 = 0.2; y0 = y(x0); x1 = 0.4; y1 = y(x1); xc = (x0+x1)/2; yc = y(xc);
xmin = -0.1; xmax = 0.6; 
x = xmin:0.002:xmax;
f = y(x); fmin = min(y(x)); fmax = max(y(x));
xy(xmin,xmax,fmin-0.3,fmax);  % 画坐标系
hold on
plot(x,f,'b','Linewidth',2)
hold on
% plot([x0 x1],[y0 y1],'r','Linewidth',2) %画弦线
text(0.05,1.0,'y = f(x)','FontSize',16);
text(x0,-0.1,'a','FontSize',16);
text(x1,-0.1,'b','FontSize',16);

text(x0-0.08,y0-0.25,'f(a)','FontSize',16);
text(x1+0.02,y0-0.25,'f(b)','FontSize',16);
plot([x0 x0],[0 y0],'k:','MarkerSize',16); %画虚线
plot([x1 x1],[0 y1],'k:','MarkerSize',16); %画虚线

x = x0:0.001:x1;
l0 = w(x,xc,x1)./w(x0,xc,x1); lc = w(x,x0,x1)./w(xc,x0,x1); l1 = w(x,x0,xc)./w(x1,x0,xc);
p = l0*y0+lc*yc+l1*y1;
fill([x0 x0 x x1 x1],[0 y0 p y1 0],'c');
plot([xc xc],[0 yc],'r','MarkerSize',16); %画虚线
text(xc-0.05,-0.1,'(a+b)/2','FontSize',12);

%text(xmin+0.1,fmin-0.4,'图4.2-2  辛普森积分示意图','FontSize',16)
axis off;
