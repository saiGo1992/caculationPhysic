function simpsona
clc;clear;format long;
[I n] = simp(@f,0,1,0.000001)
end

function [I n] = simp(f,a,b,eps)
n = 2; % n是间隔数
h = (b-a)/n;
I1 = h*(f(a)+4*f(a+h)+f(b))/3;
tol=1;
while tol>eps
    I0 = I1;
    n = 2*n;
    h = (b-a)/n;     %区间逐次分半
    x = a:h:b;       %  divide the interval
    y = f(x);        %  evaluate integrand;  y is a row vector
    I1 = h * ( y(1) + 4*sum(y(2:2:n)) +2*sum(y(3:2:n-1))+ y(n+1) )/3;
    tol= abs(I1-I0);
end
I = I1;
end

function y = f(x)
 y = exp(-x.*x);
% y=4./(1+x.^2);
% y = log(1+x)./(1+x.*x);
end