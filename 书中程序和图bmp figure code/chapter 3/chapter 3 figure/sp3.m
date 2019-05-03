% sp3.m
function [c1 c2 c3 c4] = sp3(x,y,x0)
n = length(x);
for i = 2:n-1
    a(i) = x(i+1)-x(i);
    b(i) = 2.*(x(i+1)-x(i));
    c(i) = x(i+1)-x(i);
    f(i) = 6.*((y(i+1)-y(i))/(x(i+1)-x(i))-(y(i)-y(i-1))/(x(i+1)-x(i)));
end
a(1) = 0.; b(1) = 1.;c(1) = 0.; f(1) = 0.;
a(n) = 0.; b(n) = 1.;c(n) = 0.; f(n) = 0.;
p = tri(a,b,c,f); % p是二阶导函数值
for i = 1:n-1
    c1(i) = (p(i+1)-p(i))/(x(i+1)-x(i));
    c2(i) = (x(i+1)*p(i)-x(i)*p(i+1))/(x(i+1)-x(i));
    c3(i) = ((x(i)*x(i)-2.*x(i+1)*x(i+1)-2.*x(i)*x(i+1))*p(i)+(2.*x(i)*x(i)-x(i+1)*x(i+1)...
          + 2.*x(i)*x(i+1))*p(i+1)+6.*(y(i+1)-y(i)))/6./(x(i+1)-x(i));
    c4(i) = -(x(i)*x(i+1)*((x(i)-2.*x(i+1))*p(i)+(2.*x(i)-x(i+1))*p(i+1))...
          + 6.*(x(i)*y(i+1)-x(i+1)*y(i)))/6./(x(i+1)-x(i));
end





    