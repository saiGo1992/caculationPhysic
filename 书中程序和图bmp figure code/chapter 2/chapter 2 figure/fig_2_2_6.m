x=0.6;          % x�ĳ�ʼֵ?
a=2.6:0.001:4;  % ������ȡֵ��Χ???
for j=1:150     % ��ѭ����ϵͳ�ﵽ�ȶ�̬
   x=a.*(x-x.^2); % ��x���е���?
end
figure(1);
set(gca,'FontSize',16);
for i=1:100 % ��ѭ������ֲ�ͼ
  x=a.*(x-x.^2);
  plot(a,x,'r.','marker','.','markersize',1)
  hold on;
end
grid on;
xlabel('a'),ylabel('x'),gtext('�ֲ�ͼ');
%title('ͼ2.2-6  logisticʾ��ͼ');