% demo_newtonpro.m
function demo_newtonpro
clc; clear all; format long;
x01 = 0.5; x02 =0.5;
[x n] = newtonpro([x01 x02]);
end

function y =f(x)
y(1) = x(1)-0.7*sin(x(1))-0.2*cos(x(2));
y(2) = x(2)-0.7*cos(x(1))+0.2*sin(x(2));
y = [y(1) y(2)];
end

function y = df(x)
y = [1-0.7*cos(x(1)) 0.2*sin(x(2))
    0.7*sin(x(1)) 1+0.2*cos(x(2))];
end

 function [x n] = newtonpro(x0)
x1 = x0 - f(x0)/df(x0);
n = 1;
while(norm(x1-x0)>=1.0e-6) & (n<=1000)
    x0 = x1; x1 = x0 - f(x0)/df(x0);
    n = n+1;
end
x = x1
n
 end

