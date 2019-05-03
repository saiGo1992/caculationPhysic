clc; clear all; format long;
x = 0:pi/16:pi;
y = sin(x);
yp = cos(x);
df1 = multipoint('sin(x)',x,pi/64,1);
df3 = multipoint('sin(x)',x,pi/64,3);
figure(1);
set(gca,'FontSize',16);
plot(x,df1,'r-',x,df3,'k.-',x,y,'b--',x,yp,'o');
grid on;
%title('图4.1-2  y=sin(x)的导函数');
xlabel('x');
ylabel('y');
legend('前差','中心差','原函数','导数函数')