function [x p y] = euler_pc(f,x0,y0,xn,n)
h = (xn-x0)/n;
x = x0:h:xn;
y(1) = y0; p(1) = y0;
for i = 1:n
    p(i+1) = y(i) + h*f(x(i),y(i));
    y(i+1) = y(i)+h/2*(f(x(i),y(i)) + f(x(i+1),p(i+1)));
end
