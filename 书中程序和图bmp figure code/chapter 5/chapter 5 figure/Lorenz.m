function dydt=Lorenz(t,y)
beta = 8.0/3.0; sigma = 10.0; rho = 28.;
dydt=[-beta*y(1)+y(2)*y(3);-sigma*(y(2)-y(3));-y(2)*y(1)+rho*y(2)-y(3)];
