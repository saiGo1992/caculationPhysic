function demo_iter_1
clc; clear;
% a = 0.5;
 a = 2.707;  % һ��������
% a = 3.3;   % ����������
%a = 3.5;    % 4��������
x = 0:0.01:1;
y = f(a,x);
plot(x,y,'g','linewidth',2) % ��f(x)=ax(1-x)--x
hold on 
plot(x,x,'b');              % ��f(x)=x--x
x0 = 0.1;
x1 = f(a,x0);
plot([x0 x0],[0 x1],'k');   % ����ʼ����
dy = abs(x1)/20;
ARROW([x0 x1-dy],[x0 x1])   % ����ͷ
for i = 1:20
    plot([x0 x1],[x1 x1],'k');
    x0 = x1;
    x1=f(a,x0);
    plot([x0 x0],[x0 x1],'k'); 
    pause(0.1);
end
% text(0.2,0.9,'a=2.707ʱ������ڲ�����');
end

function f = f(a,x)
f = a*x.*(1-x);
end

