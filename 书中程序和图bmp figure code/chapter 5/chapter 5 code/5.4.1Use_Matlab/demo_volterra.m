clc;
ts=0:0.1:20;
x0=[20,4];
[t,x]=ode45('volterra',ts,x0);
subplot(121);
set(gca,'FontSize',16);
plot(t,x,'LineWidth',2);grid on;
legend('x1(t)','x2(t)');
title('食饵-捕食者模型数值解'); 
xlabel('t');ylabel('x1,x2');
subplot(122); 
set(gca,'FontSize',16);
plot(x(:,1),x(:,2));grid on;
xlabel('x1');ylabel('x2');
title('食饵一捕食者相图');
