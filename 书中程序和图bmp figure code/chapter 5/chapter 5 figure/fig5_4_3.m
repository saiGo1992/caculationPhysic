y = load('dcsheath.dat');
x = y(:,1);
y1 =y(:,2);
y2 =y(:,3);
y3 =y(:,4);
subplot(121);
set(gca,'FontSize',16);
plot(x,-y1);
title('����');
xlabel('x');
ylabel('\phi');
subplot(122);
set(gca,'FontSize',16);
plot(x,y2,x,y3)
title('�����ܶ�');
xlabel('x');
ylabel('ne,ni');





