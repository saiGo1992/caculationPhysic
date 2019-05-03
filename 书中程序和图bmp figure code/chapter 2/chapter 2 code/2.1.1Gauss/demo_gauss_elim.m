clc;clear;
disp('原矩阵');
A = [1 -1 1;5 -4 3;2 1 1]
b = [-4 -12 11]
disp('消元后矩阵及解');
[A,b,x] = gauss_elim ( A, b )



