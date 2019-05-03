function demo_iter_1
clc; clear;
% a = 0.5;
 a = 2.707;  % 一个不动点
% a = 3.3;   % 两个不动点
%a = 3.5;    % 4个不动点
x = 0:0.01:1;
y = f(a,x);
plot(x,y,'g','linewidth',2) % 画f(x)=ax(1-x)--x
hold on 
plot(x,x,'b');              % 画f(x)=x--x
x0 = 0.1;
x1 = f(a,x0);
plot([x0 x0],[0 x1],'k');   % 画初始竖线
dy = abs(x1)/20;
ARROW([x0 x1-dy],[x0 x1])   % 画箭头
for i = 1:20
    plot([x0 x1],[x1 x1],'k');
    x0 = x1;
    x1=f(a,x0);
    plot([x0 x0],[x0 x1],'k'); 
    pause(0.1);
end
% text(0.2,0.9,'a=2.707时轨道趋于不动点');
end

function f = f(a,x)
f = a*x.*(1-x);
end

