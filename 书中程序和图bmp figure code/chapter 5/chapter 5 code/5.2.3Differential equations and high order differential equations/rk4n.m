function y = rk4n(deriv,n,x,dx,y)
%Classical fourth order Runge-Kutta method
%Integrates n first order differential equations 
%dy(x,y) over interval x to x+dx
x0 = x; y0 = y;
dy1 = feval(deriv,x0,y);
	y(1:n) = y0(1:n) + 0.5*dx*dy1(1:n);
dy2 = feval(deriv,x0 + 0.5*dx,y);
	y(1:n) = y0(1:n) + 0.5*dx*dy2(1:n);
dy3 = feval(deriv,x0 + 0.5*dx,y);
	y(1:n) = y0(1:n) + dx*dy3(1:n);
dy4 = feval(deriv,x0 + dx,y);
dy(1:n) = (dy1(1:n) + 2*(dy2(1:n) + dy3(1:n)) + dy4(1:n))/6;
y(1:n) = y0(1:n) + dx*dy(1:n);
end
