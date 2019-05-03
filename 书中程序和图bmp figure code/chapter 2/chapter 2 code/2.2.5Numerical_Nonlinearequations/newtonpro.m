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