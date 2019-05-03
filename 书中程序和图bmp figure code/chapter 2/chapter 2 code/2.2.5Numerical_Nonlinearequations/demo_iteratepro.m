% iteratepro.m
function demo_iteratepro
clc; clear all; format long;
x01 = 0.5; x02 =0.5;
[x n] = iteratepro([x01 x02]);
function [x n] = iteratepro(x0)
x1 = g(x0);
n = 1;
while(norm(x1-x0)>=1.0e-6) & (n<=1000)
    x0 = x1;
    x1 = g(x0);
    n = n+1;
end
x = x1
n
function y =g(x)
y(1) = 0.7*sin(x(1))+0.2*cos(x(2));
y(2) = 0.7*cos(x(1))-0.2*sin(x(2));
y = [y(1) y(2)];



