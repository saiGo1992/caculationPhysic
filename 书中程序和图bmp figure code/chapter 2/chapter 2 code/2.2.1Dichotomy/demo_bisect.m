% demo_bisect.m
clc; clear all;
format long;
f = inline('exp(x)*log(x)-x*x');
eps = 1e-5; a = 1; b = 2;
% f = inline('x-2*sin(x.^2)');
% eps = 1e-4; a = 0.4; b = 0.6;
root = bisect(f,a,b,eps)
