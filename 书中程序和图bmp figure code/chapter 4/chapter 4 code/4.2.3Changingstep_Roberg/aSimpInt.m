function [S nsub] = aSimpInt(f,a,b,eps)
nsub = 2;
even = f((a+b)/2);
odd = 0;
S = (b-a)*(f(a) + 4*even + 2*odd + f(b))/6;
inall = even + odd;
tol = 1;
while tol > eps
    S0 = S;
    nsub = 2*nsub;
    n = nsub + 1;        %  total number of points
    h = (b-a)/nsub;      %  stepsize
    x = a:h:b;           %  divide the interval
    even = sum(f(x(2:2:n-1))); % 偶节点
    odd = inall; % 间隔取半前的全部内节点inall 在间隔取半时全部变为奇节点
    S = (h/3)*( f(a) + 4*even +2*odd + f(b));
    inall = even + odd; 
    tol = abs(S - S0);
end
