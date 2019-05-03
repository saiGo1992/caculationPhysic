% linearfit.m
function [a b] = linearfit(x,y)
n = length(x);
x2 = x.*x;      xy = x.*y;
sx = sum(x);    sy = sum(y);
sxy = sum(xy); sx2 = sum(x2);
deno = n*sx2 - sx*sx;
a = (sy*sx2-sx*sxy)/deno;
b = (n*sxy-sx*sy)/deno;
end




