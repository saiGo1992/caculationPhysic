% Euler方法的计算程序euler_pc.m
function[x,p,y]=euler_pc(f,x0,y,xn,n)
h=(xn-x0)/n;
x=x0:h:xn;
y(1)=y0;
for i=1:n
    p(i+1)=y(i)+h*f(x(i),y(i));%显示格式，作为预测值
    y(i+1)=y(i)+h/2*(f(x(i),y(i))+f(x(i+1),p(i+1)));%校正格式
end

%例题：
%描述指数衰减问题的微分方程dy/dt = -lamda*y，lamda取-1为衰减常数，取t=0，y(0)=1,lamda=1,求t在区间[0,8]
%的衰减函数曲线
% function decay
% dt =0.1;
% lambda = 1.0;
% n=80;
% t(1) = 0; y(1) = 1.0;
% p(1)=1.0;%p作为校正结果来对比
% for i =1:n
%     %左矩形算法
%     t(i+1) = (i+1)*dt;
%     f(i) = -lambda*y(i);
%     y(i+1) = y(i)+dt*f(i);%预测值
%     p(i+1) = y(i)+dt/2*(f(i)+(-lambda*y(i+1)));%校正格式
% end 
% figure(1);
% set (gca, 'FontSize', 16);
% plot (t, y, 'b.',t,y(1)*exp(-lambda.*t),'r-');
% hold on;
% plot (t, p, 'c.');
% legend ('数值解','精确解'); 
% xlabel ('t');ylabel('y(t)');
% grid on;
