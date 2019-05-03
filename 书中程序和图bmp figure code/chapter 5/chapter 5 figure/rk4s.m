function [tout, yout] = rk4s(fun, tspan, y0, n)

% [t,y] = rk4s('f', tspan, y0,n) 
%      dx/dt = x + y,       x(0)=1
%      dy/dt = x - y - t,   y(0)=0
% function yprime = f(t,y)
% yprime = [y(1)+y(2); y(1)-y(2)-t];
% [t,y]=rk4s('f',[0, 2],[1; 0],2)
% to get an x versus t plot, try plot(t,y(:,1))  
% to get a y versus t plot, try plot(t,y(:,2))
% to get a plot in the phase plane, try plot(y(:,1),y(:,2))

% initialization
t0=tspan(1); tf=tspan(2);
h = (tf - t0)/n; 
% initialization
t = t0;
y = y0(:);
tout = t;
yout = y.';
% the main loop
while (t < tf)
      	if t + h > tf, h = tf - t; end
% compute the slopes
  	s1 = feval(fun, t, y); s1 = s1(:);
  	s2 = feval(fun, t + h/2, y + h*s1/2); s2=s2(:);
	s3 = feval(fun, t + h/2, y + h*s2/2); s3=s3(:);
	s4 = feval(fun, t + h, y + h*s3); s4=s4(:);
	t = t + h;
	y = y + h*(s1 + 2*s2 + 2*s3 +s4)/6;
	tout = [tout; t];
	yout = [yout; y.'];
end;

