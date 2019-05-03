% demo_iter.m
clc;clear;
 % f = inline('(x+1).^(1/2)');  x0 = 0.5; 
 f = inline('x.^2-1');  x0 = 0.0; 
 % f = inline('exp(-x)');  x0 = 0.5; 
 % f = inline('1+x-x*x/4');  x0 = 1.5;
 
 tol = 0.00001; x =f(x0); k=0; 
while abs(x-x0)>=tol
   x0 = x; x = f(x0); k = k+1;       % k 是迭代次数
   fprintf('%10.0f %14.8f \n', k,x)  % 10     1.61803068
end


