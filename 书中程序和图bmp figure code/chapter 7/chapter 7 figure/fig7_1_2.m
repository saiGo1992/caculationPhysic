% ���˹Τ���ʷֲ�ֱ��ͼ 
clc; clf; clear;
figure(1);
set(gca,'FontSize',16);
v = 0:0.2:4;
fv = 4/sqrt(pi)*exp(-v.^2).*v.^2;
% plot(v,fv);
% hold on;
bar(v,fv);
xlabel('v/v_p');
ylabel('f(v)');
XLIM([0 4]);
%title('ͼ7.1-2  ���˹Τ���ʷֲ�ֱ��ͼ');







