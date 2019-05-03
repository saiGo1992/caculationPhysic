% demo_secant1.m
clc; clear;
format long;
% f = inline('x^3-2*x^2-x+2');
% xl =0.4; xu = 1.4; eps = 0.000001;
f = inline('exp(x).*log(x)-x.*x');
x0 =1.0; x1 = 2.0; eps = 0.000001;nmax = 100; 
[root n] = secant(f,x0,x1,eps,nmax)
