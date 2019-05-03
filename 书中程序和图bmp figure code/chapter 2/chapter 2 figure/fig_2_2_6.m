x=0.6;          % x的初始值?
a=2.6:0.001:4;  % 参数的取值范围???
for j=1:150     % 此循环让系统达到稳定态
   x=a.*(x-x.^2); % 对x进行迭代?
end
figure(1);
set(gca,'FontSize',16);
for i=1:100 % 此循环输出分岔图
  x=a.*(x-x.^2);
  plot(a,x,'r.','marker','.','markersize',1)
  hold on;
end
grid on;
xlabel('a'),ylabel('x'),gtext('分岔图');
%title('图2.2-6  logistic示意图');