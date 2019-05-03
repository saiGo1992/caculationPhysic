% 例题7_2_2.m
figure(1);
set(gca,'FontSize',16);
t = rand(1000,1);
y = -log(t);
z = exp(-y);
plot(y,z,'.');
%xlabel('图7.2-2  例题7.2.2-指数分布抽样')
