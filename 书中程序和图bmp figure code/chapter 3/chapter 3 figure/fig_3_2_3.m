% demo_multifit.m
clc;clear all;
format long;
x =-1:0.2:1;
y = exp(x);
m = 5;
a = multifit(x,y,m);
c =[a(6) a(5) a(4) a(3) a(2) a(1)];
x1=-1:0.02:1;
y1=polyval(c,x1);
figure(1);
set(gca,'FontSize',16);
plot(x1,y1,'r',x,y,'o');
%title('ͼ3.2-3  5�ζ���ʽ��� e^x');
xlabel('x');
ylabel('y');
grid on;

