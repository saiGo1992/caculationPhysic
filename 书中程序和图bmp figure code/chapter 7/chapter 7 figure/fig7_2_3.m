% 例题7.2.5
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
legend('原来成绩分布','抽样成绩分布');
xlim([40 100]);
%text( 47,-0.04,'图7.2-3  学生成绩分布和抽样分布','FontSize',16);



   