% demo_lu_decom.m
clc;clear;
A = [2 2 3;4 7 7; -2 4 5]
b = [3 1 -7]
[L,U,x] = lu_decom(A,b)
% x = lufact(A,b)


