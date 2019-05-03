function S = SimpInt2(f,a,b,ndouble_sub)
n = 2*ndouble_sub + 1;        %  total number of points
h = (b-a)/(n-1);              %  stepsize
x = a:h:b;                    %  divide the interval
y = f(x);             %  evaluate integrand;  y is a row vector
ends = y(1)+y(n);
even = sum(y(2:2:n-1)); odd = sum(y(3:2:n-2));
S = (h/3)*( ends + 4*even +2*odd);
end
