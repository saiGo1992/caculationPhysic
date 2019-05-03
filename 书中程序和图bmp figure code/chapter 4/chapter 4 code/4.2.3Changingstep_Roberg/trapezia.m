function trapezia
clc;clear;format long;
[I n] = trap(@f,0,1,0.000001)
end

function [I n] = trap(f,a,b,eps)
n = 1; % n是间隔数
h = (b-a)/n;
I1 = 0.5*h*(f(a)+f(b));
tol=1;
while tol>eps
    I0 = I1;
    n = 2*n;
    h = (b-a)/n;     %区间逐次分半
    x = a:h:b;       %  divide the interval
    y = f(x);        %  evaluate integrand;  y is a row vector
    I1 = h * ( 0.5*y(1) + sum(y(2:n)) + 0.5*y(n+1) );
    tol= abs(I1-I0);
end
I = I1;
end

function y = f(x)
  y = exp(-x.*x);
% y=4./(1+x.^2);
% y = log(1+x)./(1+x.*x);
end