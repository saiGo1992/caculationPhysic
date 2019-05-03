function S = SimpInt1(f,a,b,ndouble_sub)
n = 2*ndouble_sub + 1;        %  total number of points
h = (b-a)/(n-1) ;     %  stepsize
x = a:h:b;           %  divide the interval
y = f(x);    %  evaluate integrand;  y is a row vector
S = (h/3)*( y(1) + 4*sum(y(2:2:n-1)) + 2*sum(y(3:2:n-2)) + y(n) );
end
