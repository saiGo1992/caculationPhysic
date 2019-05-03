% ͼ2.2-4(b) �ҽص������������ʾ��ͼ
clc; clf; clear;
y = inline('x.^3+2*x.^2+3*x-1');
x0 = 0.9; y0 = y(x0); x1 = 0.5; y1 = y(x1);
yp = (y1-y0)/(x1-x0); x2 = x1-y1/yp; y2 = y(x2);
xmin = -0.1; xmax = 1.0; 
x = xmin:0.002:xmax;
f = y(x); fmin = min(y(x)); fmax = max(y(x));
xy(xmin,xmax,fmin,fmax-0.3);  % ������ϵ
hold on
plot(x,f,'b','Linewidth',2)
hold on
plot([x0 x2],[y0 0],'r','Linewidth',1) %������
% plot([x1 x2],[y1 0],'r','Linewidth',1) %������

text(0.35,2.5,'y = f(x)','FontSize',16);
text(x0-0.05,-0.3,'x_k_-_1','FontSize',16);
text(x1-0.05,-0.3,'x_k','FontSize',16);
text(x2-0.05,-0.3,'x_k_+_1','FontSize',16);
text(x2-0.1,0.3,'x^*','FontSize',16);
text(x0+0.05,3.5,'f(x_k_-_1)','FontSize',16);
text(x1+0.05,1.0,'f(x_k)','FontSize',16);
plot([x0 x0],[0 y0],'k:','MarkerSize',16); %������
plot([x1 x1],[0 y1],'k:','MarkerSize',16); %������
plot([x2 x2],[0 y2],'k:','MarkerSize',16); %������

%text(xmin-0.2,fmin-0.3,'ͼ2.2-4(b) �ҽص������������ʾ��ͼ','FontSize',16)
axis off;
