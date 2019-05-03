
function [T nsub]= aTrapInt(f,a,b,eps)
tol = 1; nsub = 1;
inall = 0;
T = 0.5*(b-a)*(f(a)+f(b));
while tol > eps
T0 = T;
nsub = 2*nsub;  
n = nsub + 1;        %  total number of nodes
h = (b-a)/nsub;      %  stepsize
x = a:h:b;           %  divide the interval
inall = inall + sum(f(x(2:2:n-1)));
T =  0.5*h * (f(a)+2*inall+f(b));
tol = abs(T-T0);
end
end 



