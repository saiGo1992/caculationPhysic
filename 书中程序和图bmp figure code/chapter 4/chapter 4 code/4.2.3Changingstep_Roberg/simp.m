function [I n] = simp(f,a,b,eps)
n = 2; % n 是子区间数
h = (b-a)/n;
I1 = h*(f(a)+4*f(a+h)+f(b))/3;
tol=1;
while tol>eps
    I0 = I1;
    n = 2*n;     h = (b-a)/n;     
x = a:h:b;  y = f(x);        
    I1 = h * ( y(1) + 4*sum(y(2:2:n)) +2*sum(y(3:2:n-1))+ y(n+1) )/3;
    tol= abs(I1-I0);
end
I = I1;
end


