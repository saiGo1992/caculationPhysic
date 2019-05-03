% 图2.2-3(b) 不动点迭代法方程求根示意图
clc; clf; clear;
y = inline('x.^2-1');
x=-1:0.002:1.8;
g1 = y(x);
plot(x,g1,'b',x,x,'r','Linewidth',2)
hold on;
ARROW([0 0],[2.2 0],20,'BaseAngle',60)
text(2.3,0,'x','FontSize',16);
ARROW([0 -1],[0 2.2],20,'BaseAngle',60)
text(0,2.4,'y','FontSize',16)
text(-1.4,0.3,'y_1=g_2(x)= x^2-1','FontSize',16);
text(0.4,1,'y_2= x','FontSize',16);

x0=0.5; f0=y(x0);
text(x0-0.2,-0.2,'x_0=0.5','FontSize',16)

ARROW([x0 0],[x0 f0],10,'BaseAngle',60)
for i=1:14
ARROW([x0 f0],[f0 f0],10/i,'BaseAngle',60)
x0 = f0; f0=y(x0);
ARROW([x0 x0],[x0 f0],10/i,'BaseAngle',60)
end 
%text(-1.1,-1.4,'图2.2-3(b) 迭代法方程求根示意图','FontSize',16)
axis off;
