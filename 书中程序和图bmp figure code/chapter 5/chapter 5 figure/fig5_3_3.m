y = load('shoot0.txt');
z = load('shoot1.txt')
x = y(:,1);
y0 =y(:,2);
y1 =z(:,2);
figure(1);
set(gca,'FontSize',16);
plot(x,y1,x,y0,'LineWidth',2)
hold on;
%title('ͼ 5.3-3  ��з������΢�ַ���');
xlabel('time(��)');
ylabel('y(��)');
grid on;
legend('�п�����v_0=36.7m/s','�޿�����v_0=32.5m/s');