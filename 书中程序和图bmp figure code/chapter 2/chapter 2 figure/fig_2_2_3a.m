% 图2.2-3(a) 不动点迭代法方程求根示意图
clc; clf; clear;
y = inline('(x+1).^(1/2)');
% y = inline('x.^3-1');
x=0:0.002:2.2;
g1 = y(x);
plot(x,g1,'b',x,x,'r','Linewidth',2)
hold on;
ARROW([0 0],[2.2 0],20,'BaseAngle',60)
text(2.3,0,'x','FontSize',16,'FontName','Times New Roman', 'FontAngle','italic');
ARROW([0 0],[0 2.2],20,'BaseAngle',60)
text(0,2.4,'y','FontSize',16,'FontName','Times New Roman', 'FontAngle','italic')
text(0.1,1.7,'y_1=g_1(x)= (x+1)^1^/^2','FontSize',16,'FontName','Times New Roman', 'FontAngle','italic');
text(1.2,1,'y_2= x','FontSize',16','FontName','Times New Roman','FontAngle','italic');

x0=0.5; f0=y(x0);
text(x0-0.2,-0.2,'x_0= 0.5','FontSize',16,'FontName','Times New Roman', 'FontAngle','italic')

ARROW([x0 0],[x0 f0],10,'BaseAngle',60)
for i=1:3
ARROW([x0 f0],[f0 f0],10/i,'BaseAngle',60)
x0 = f0; f0=y(x0);
ARROW([x0 x0],[x0 f0],10/i,'BaseAngle',60)
end 
%text(0,-0.5,'图2.2-3(a) 迭代法方程求根示意图','FontSize',16)
axis off;
