% ͼ2.2-2 �ҽط��������ʾ��ͼ
clc; clf; clear;
y = inline('exp(x).*log(x)-x.^2');
x=0.4:0.005:2.2;
fx = y(x);
plot(x,fx,'b','Linewidth',3)
hold on;
ARROW([-.2 0],[2.5 0],20,'BaseAngle',60)
text(2.6,0,'x','FontSize',16);
ARROW([0 -1.5],[0 2.4],20,'BaseAngle',60)
text(0.1,2.3,'f(x)=e^xln(x)-x^2 ','FontSize',16);
xl=1; xu=2;
fl=y(xl);fu=y(xu);
xr=xu-(xu-xl)/(fu-fl)*fu;
fr=y(xr);
hold on
plot([xl xl],[0 fl],'k:','MarkerSize',10) %����xl��������
plot([0 xl],[fl fl],'k:','MarkerSize',10) %����f(xl)�������
plot([xu xu],[0 fu],'k:','MarkerSize',10) %����xu��������
plot([0 xu],[fu fu],'k:','MarkerSize',10) %����f(xu)�������
plot([xr xr],[0 fr],'k:','MarkerSize',10) %����xr��������
plot([0 xr],[fr fr],'k:','MarkerSize',10) %����f(xr)�������
plot([xl xu],[fl fu],'r','Linewidth',3)   %����
text(0.8,0.2,['x_l=',num2str(xl)],'FontSize',16)
text(1.8,-0.3,['x_u=',num2str(xu)],'FontSize',16)
text(xr-0.1,0.2,'x_r','FontSize',16)
text(-0.3,fu,'f(x_u)','FontSize',16)
text(-0.3,fl,'f(x_l)','FontSize',16)
text(-0.3,fr,'f(x_r)','FontSize',16)
%text(0,-2.2,'ͼ2.2-2 �ҽط��������ʾ��ͼ','FontSize',16)
axis off;

