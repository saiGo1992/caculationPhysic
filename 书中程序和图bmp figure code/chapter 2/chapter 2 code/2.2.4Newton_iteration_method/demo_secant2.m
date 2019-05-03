% demo_secant2.m
clc; clear;
format long;
% f = inline('x^3-2*x^2-x+2');
f = inline('exp(x)*log(x)-x*x');
% xl =0.4; xu = 1.4; eps = 0.000001;
x0 =1.0; x1 = 2.0; eps = 0.000001;
nmax = 100; n = 0;
while((abs(x1-x0)>=eps) & (n<=nmax))
    x2 = x1-f(x1)*(x1-x0)/(f(x1)-f(x0));
    x0=x1;x1=x2;n=n+1;
end
x2
n
