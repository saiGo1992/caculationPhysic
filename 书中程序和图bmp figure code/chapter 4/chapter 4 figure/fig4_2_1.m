% ͼ4.2-1 ���λ���ʾ��ͼ
clc; clf; clear;
y = inline('x.^3-4*x.^2+3*x+0.5');
x0 = 0.2; y0 = y(x0); x1 = 0.4; y1 = y(x1);
xmin = -0.1; xmax = 0.6; 
x = xmin:0.002:xmax;
f = y(x); fmin = min(y(x)); fmax = max(y(x));
xy(xmin,xmax,fmin-0.3,fmax);  % ������ϵ
hold on
plot(x,f,'b','Linewidth',2)
hold on
plot([x0 x1],[y0 y1],'r','Linewidth',2) %������
text(0.05,1.0,'y = f(x)','FontSize',16);
text(x0,-0.1,'a','FontSize',16);
text(x1,-0.1,'b','FontSize',16);
text(x0-0.08,y0-0.25,'f(a)','FontSize',16);
text(x1+0.02,y0-0.25,'f(b)','FontSize',16);
plot([x0 x0],[0 y0],'k:','MarkerSize',16); %������
plot([x1 x1],[0 y1],'k:','MarkerSize',16); %������
fill([x0 x1 x1 x0 x0],[0 0 y1 y0 0],'c');
%text(xmin+0.1,fmin-0.4,'ͼ4.2-1  ���λ���ʾ��ͼ','FontSize',16)
axis off;
