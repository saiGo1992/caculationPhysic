function demo_Lorenz
clear all; format long;
[T,Y]=ode45('Lorenz',[0,30],[12;4;0]);
subplot(121);
set(gca,'FontSize',16);
plot3(Y(:,1),Y(:,2),Y(:,3))
view(-20,60);
xlabel('y_1');ylabel('y_2');zlabel('y_3');
subplot(122);
set(gca,'FontSize',16);
plot(T,Y(:,1),T,Y(:,2),T,Y(:,3));
xlabel('t');ylabel('y_1,  y_2,  y_3');
end

function dydt=Lorenz(t,y)
beta = 8.0/3.0; sigma = 10.0; rho = 28.;
dydt=[-beta*y(1)+y(2)*y(3);-sigma*(y(2)-y(3));-y(2)*y(1)+rho*y(2)-y(3)];
end

