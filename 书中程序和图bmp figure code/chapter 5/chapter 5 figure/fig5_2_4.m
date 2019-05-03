function charge_particle
clc; clear all; format long;
n = 6; t0 = 0; dt = 0.1; 
y = [1 1 0 1 0 1];
for i = 1:500
    t(i) = t0 + (i-1)*dt;
    y = rk4n(@dfun,n,t(i),dt,y);
    y1(i) = y(1); y2(i) = y(2); y3(i)=y(3);
end
figure(1);
set(gca,'FontSize',16);
plot3(y1,y2,y3,'LineWidth',2);
xlabel('x(t)');
ylabel('y(t)');
zlabel('z(t)');
%title('图5.2-4  带电粒子在均匀磁场中的运动');
grid on;
end

function dy = dfun(t,y)
dy = [y(4),y(5),y(6),y(5),-y(4),0];
end