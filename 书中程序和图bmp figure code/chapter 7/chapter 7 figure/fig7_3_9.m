figure(1);
set(gca,'FontSize',16);
z=load('decay.dat');
x=z(:,1);
y=z(:,2);
plot(x,y,'.');
grid on;
xlabel('t');
ylabel('N/N_0');
%title('ͼ7.3-9  ĸ����ʱ��ı仯��ϵ');
hold on;
t=0:1:300;
alfa=0.03;
plot(t,exp(-0.03*t),'r');
legend('ģ����','��ȷ���');





