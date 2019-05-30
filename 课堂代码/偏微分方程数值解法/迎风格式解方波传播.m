%���ʼ����Ϊ����������a=-1,����ӭ���ʽ��ֵ���㲨�Ĵ���.
clc;clear all;
L=15;dx=0.1;
dt=0.05;
a=-1.;
x=(-L+dx:dx:0)';
n=length(x);
u1=zeros(1,n-20);u2=ones(1,10);u3=zeros(1,10);
u=[u1 u2 u3]';%һ��ʼ�Ĳ������ݣ����������ݣ�������Ϊ15�������Ϊ40��1��20��u=0��21��30��u=0,31��40��u=1,������λ���������ұ�
r=a*dt/dx;
u0=u;
figure(1);
set(gca,'FontSize',16);
plot(x,u','LineWidth',2);
axis([-15 0 -1 2]);
for t=dt:dt:10.
    u(1:n-1)=(1+r)*u(1:n-1)-r*u(2:n);
    hold off;%����ٻ����滻ԭͼ
    plot(x,u,'LineWidth',2);           
    axis([-15 0 -1 2]);
    pause(0.05);%��ͣ0.05s,�γɶ���Ч��
end
hold on;plot(x,u0','r','LineWidth',2);
axis([-15 0 -1 2]);
xlabel('x');
ylabel('u(x,t)');