% 高斯-赛德尔迭代法
clear; clc;
format long;
A=[7 2 1 -2;9 15 3 -2;-2 -2 11 5;1 3 2 13]
b=[4 7 -1 0]'
% A = [10 -2 -2; -2 10 -1; -1 -2 3], b=[1 0.5 1]'
[x,k,flag]=gsdl(A,b)
