clc; clear all;
x = 0:0.01:1;
a1 = 0.0448; a2 = 0.0569;
uc = 0.2222*x.*(1-x);
ul = 0.2305*x.*(1-x);
ug = 0.2272*x.*(1-x);
% ug2(1:34)   = 3*a1.*x(1:34);
% ug2(34:67)  = a1.*(2-3*x(34:67))+a2.*(3*x(34:67)-1);
% ug2(67:101) = 3*a2.*(1-x(67:101));
ue = -(exp(x)-exp(-x))/(exp(1)-exp(-1))+x;
% plot(x,uc,'k',x,ul,'b',x,ug,'g',x,ug2,'g:',x,ue,'r');
figure(1);
set(gca,'FontSize',16);
plot(x,uc,'k',x,ul,'b',x,ug,'g',x,ue,'r','LineWidth',2);
legend('���÷�','���˷�','���ɽ�','��ȷ��');
% legend('���÷�','���˷�','���ɽ�','�Ľ����ɽ�','��ȷ��');
xlabel('x'); ylabel('u(x)');
%title('ͼ9.1-1  ���ֲ�ͬ�ⷨ�Ľ���뾫ȷֵ�ıȽ�')
grid on;
