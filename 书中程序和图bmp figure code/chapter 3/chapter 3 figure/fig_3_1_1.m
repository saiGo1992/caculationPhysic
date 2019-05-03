clc; clear;
z1 = load('exa3_1_3.txt');
z2 = load('exa3_1_3_old.txt');
x1 = z1(:,1);
y1 = z1(:,2);
x2 = z2(:,1);
y2 = z2(:,2);
figure(1);
set(gca,'FontSize',16);
plot(x1,y1,'r',x2,y2,'bo','Linewidth',2)
legend('插值曲线','插值点');
%title('图3.1-1  例题3.1.3三点抛物线插值示意图');
grid on;
xlabel('x');
ylabel('y');





