z1 = load('exa4_1_2.txt');
z2 = load('exa4_1_2_old.txt');
x1 = z1(:,1);
y1 = z1(:,2);
x2 = z2(:,1);
y2 = z2(:,2);
figure(1);
set(gca,'FontSize',16);
plot(x2,y2,'r',x1,y1,'b','Linewidth',2)
legend('f(x)=sin(x)','��ֵ΢��df(x)/dx');
hold on;
plot([0 7],[0,0]),'k';
%title('ͼ4.1-3  sin(x)��ֵ΢��');
xlabel('x');
ylabel('y');
grid on;
