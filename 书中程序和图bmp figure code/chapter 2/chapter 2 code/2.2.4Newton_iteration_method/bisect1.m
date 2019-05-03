% bisect1.m
clc; clear;
format long;
% f = inline('x^3-2*x^2-4*x-7')';
% xl = 3; xu = 4; eps = 0.000001;

% f = inline('x^3-2*x^2-x+2');
% xl =0.4; xu = 1.4; eps = 0.000001;

f = inline('exp(x)*log(x)-x*x');
xl =1.0; xu = 2.0; eps = 0.000001;
yl = f(xl); yu = f(xu);
n  = 1+round((log(xu-xl)-log(eps))/log(2))  % 由要求精度计算循环次数
for k=1:n
    xm=0.5*(xl+xu); ym=f(xm);
    if yl*ym<0
        xu=xm; yu=ym;
    else
        xl=xm; yl=ym;
    end
    if xu-xl<eps, break, end
end
xm =(xl+xu)*0.5 % c函数零点.
