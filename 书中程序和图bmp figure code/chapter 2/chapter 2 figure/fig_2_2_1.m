% 图2.2-1 二分法方程求根示意图
clc; clf; clear;
y = inline('x.^3-5*x.^2+6*x');
x=-0.05:0.005:3.2;
fx = y(x);
plot(x,fx,'b','Linewidth',2)
hold on;
ARROW([-0.5 0],[3.5 0],20,'BaseAngle',60)
text(2.6,0,'x','FontSize',16);
ARROW([0 -0.6],[0 2.5],20,'BaseAngle',60)
text(0.1,2.3,'f(x)=x^3-5x^2+6x ','FontSize',16);
xl=1.4; xu=2.4;
fl=y(xl);fu=y(xu);
hold on
plot([xl xl],[0 fl],'r','Linewidth',2)
plot([0 xl],[fl fl],'r:','MarkerSize',10)
plot([xu xu],[0 fu],'r','Linewidth',2)
plot([0 xu],[fu fu],'r:','MarkerSize',10)
text(-0.4,fu,'f(x_u)','FontSize',16)
text(-0.4,fl,'f(x_l)','FontSize',16)
text(xl-0.1,-0.2,['x_l=',num2str(xl)],'FontSize',16)
text(xu-0.1, 0.2,['x_u=',num2str(xu)],'FontSize',16)
%text(-0.0,-1.0,'图2.2-1 二分法方程求根示意图','FontSize',16)
axis off;
% centaxes;
% title('x^3-5*x^2+6x=0')