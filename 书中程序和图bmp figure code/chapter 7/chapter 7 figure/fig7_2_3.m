% ����7.2.5
clear all;clc;
z=load('scores_old.txt');
zz=load('scores_sample.txt');
x=z(:,1);
yold=z(:,2);
ynew=zz(:,2);
figure(1);
set(gca,'FontSize',16);
bar(x,yold,0.2,'r');
hold on;
bar(x+3,ynew,0.2);
legend('ԭ���ɼ��ֲ�','�����ɼ��ֲ�');
xlim([40 100]);
%text( 47,-0.04,'ͼ7.2-3  ѧ���ɼ��ֲ��ͳ����ֲ�','FontSize',16);



   