function demo_rk4s
[x,y]=rk4s(@f21,[0, 1],[-0.4; -0.6],40);
% [x y] = ode23(@f21,[0,1],[-0.4;-0.6])
figure(1);
set(gca,'FontSize',16);
plot(x,y(:,1),'r',x,y(:,2),'LineWidth',2);
xlabel('x');ylabel('y');
legend('y(1) = y(x) ','y(2) = dy/dx');
%title('Í¼5.2-5  ÀýÌâ5.2.5º¯ÊýÍ¼Ïñ');
grid on;
end
