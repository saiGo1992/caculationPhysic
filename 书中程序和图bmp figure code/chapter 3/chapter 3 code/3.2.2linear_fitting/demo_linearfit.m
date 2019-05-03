% deno_linearfit.m
clc;clear all;
format long;
x =[0.5 1.2 2.1 2.9 3.6 4.5 5.7];
y =[2.81 3.24 3.80 4.30 4.73 5.29 6.03];
[a b]=linearfit(x,y);
c =[b a];
x1=0:0.1:6;
y1=polyval(c,x1);
figure(1);
set(gca,'FontSize',16);
plot(x1,y1,x,y,'o');
xlabel('x');
ylabel('y');
title('ͼ3.2-1  p(x)=a+bx');
text(1.5,6.0,['a = ',num2str(a)],'Fontsize',16,'BackgroundColor',[.7 .9 .7]);
text(1.5,5.5,['b = ',num2str(b)],'Fontsize',16,'BackgroundColor',[.7 .9 .7]);
