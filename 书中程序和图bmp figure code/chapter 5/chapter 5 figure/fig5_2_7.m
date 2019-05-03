function demo_rk4sstiff
subplot(121);
 [t,y]=rk4s(@f,[0, 0.02],[1; 0],400);
%  [t y] = ode23(@f,[0,0.01],[1;0])
figure(1);
set(gca,'FontSize',16);
plot(t,y(:,1),'r',t,y(:,2),'LineWidth',2);
xlabel('t');ylabel('y_1,y_2');
legend('y_1(t)','y_2(t)');
subplot(122);
set(gca,'FontSize',16);
[t y]=rk4s(@f,[0.02,6],[y(401,1);y(401,2)],10000);
% [t y] = ode23(@f,[0.01,6],[2;-1])
plot(t,y(:,1),'r',t,y(:,2),'LineWidth',2);
xlabel('t');ylabel('y_1,y_2');
legend('y_1(t)','y_2(t)');
title('Stiff ODE'); 
end
 function yp = f(t,y)
 yp = [998*y(1)+1998*y(2); -999*y(1)-1999*y(2)];
 end
