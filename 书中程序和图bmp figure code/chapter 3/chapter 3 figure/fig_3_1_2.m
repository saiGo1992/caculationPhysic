clc; clear;
z1 = load('exa3_1_4.txt');
z2 = load('exa3_1_4_old.txt');
x1 = z1(:,1);
y1 = z1(:,2);
x2 = z2(:,1);
y2 = z2(:,2);
figure(1);
set(gca,'FontSize',16);
plot(x1,y1,'r',x2,y2,'bo','Linewidth',2)
legend('��ֵ����','��ֵ��');
%title('ͼ3.1-2  ����3.1.4�ŵ��������ղ�ֵʾ��ͼ');
grid on;
xlabel('x');
ylabel('y');





