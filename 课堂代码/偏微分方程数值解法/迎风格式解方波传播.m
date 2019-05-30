%设初始波形为方波，波速a=-1,采用迎风格式数值计算波的传播.
clc;clear all;
L=15;dx=0.1;
dt=0.05;
a=-1.;
x=(-L+dx:dx:0)';
n=length(x);
u1=zeros(1,n-20);u2=ones(1,10);u3=zeros(1,10);
u=[u1 u2 u3]';%一开始的波形数据，即方波数据，将长度为15的区间分为40格，1到20格u=0，21到30格u=0,31到40格u=1,即方波位于区间最右边
r=a*dt/dx;
u0=u;
figure(1);
set(gca,'FontSize',16);
plot(x,u','LineWidth',2);
axis([-15 0 -1 2]);
for t=dt:dt:10.
    u(1:n-1)=(1+r)*u(1:n-1)-r*u(2:n);
    hold off;%如果再画，替换原图
    plot(x,u,'LineWidth',2);           
    axis([-15 0 -1 2]);
    pause(0.05);%暂停0.05s,形成动画效果
end
hold on;plot(x,u0','r','LineWidth',2);
axis([-15 0 -1 2]);
xlabel('x');
ylabel('u(x,t)');