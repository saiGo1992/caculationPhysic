% demo_lagrange.m使用lagrange插值程序的例子
x = 0:3;
y =[-5,-6,-1,16];
u = -0.25:.01:3.25;
v = lagrange_1(x,y,u);
figure(1);
set(gca,'FontSize',16);
plot(x,y,'bo',u,v,'r','Linewidth',2)
legend('插值点','插值曲线');
title('图3.1-3  拉格郎日插值');
grid on;
xlabel('x');
ylabel('y');
