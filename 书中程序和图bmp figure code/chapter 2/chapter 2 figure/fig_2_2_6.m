x=0.6;          % xµÄ³õÊ¼Öµ?
a=2.6:0.001:4;  % ²ÎÊıµÄÈ¡Öµ·¶Î§???
for j=1:150     % ´ËÑ­»·ÈÃÏµÍ³´ïµ½ÎÈ¶¨Ì¬
   x=a.*(x-x.^2); % ¶Ôx½øĞĞµü´ú?
end
figure(1);
set(gca,'FontSize',16);
for i=1:100 % ´ËÑ­»·Êä³ö·Ö²íÍ¼
  x=a.*(x-x.^2);
  plot(a,x,'r.','marker','.','markersize',1)
  hold on;
end
grid on;
xlabel('a'),ylabel('x'),gtext('·Ö²íÍ¼');
%title('Í¼2.2-6  logisticÊ¾ÒâÍ¼');