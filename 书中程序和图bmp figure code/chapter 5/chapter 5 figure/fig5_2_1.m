function decay  % using Euler method
% solution of differential equation dy/dt=-lambda y
dt = 0.1;      % time step
lambda = 1.0;  % decay constant
n =80;         % loop index and no. of steps
t(1) = 0; y(1) = 1.0;   % initial y0

for i = 1:n
    t(i+1) = (i-1)*dt;
    f(i) = -lambda*y(i);
    y(i+1) = y(i) + dt*f(i);
end
figure(1);
set(gca,'FontSize',16);
plot(t, y, 'b.',t,y(1)*exp(-lambda.*t),'r-');
legend('数值解','精确解');
xlabel('t');ylabel('y(t)');
%title('图5.2-1  例题5.2.1的数值解和精确解');
grid on;
end
