y = load('shoot0.txt');
z = load('shoot1.txt')
x = y(:,1);
y0 =y(:,2);
y1 =z(:,2);
figure(1);
set(gca,'FontSize',16);
plot(x,y1,x,y0,'LineWidth',2)
hold on;
%title('图 5.3-3  打靶法解二阶微分方程');
xlabel('time(秒)');
ylabel('y(米)');
grid on;
legend('有空气阻v_0=36.7m/s','无空气阻v_0=32.5m/s');