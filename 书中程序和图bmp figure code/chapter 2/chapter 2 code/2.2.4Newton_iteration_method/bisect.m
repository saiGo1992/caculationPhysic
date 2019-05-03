% bisect.m
function root = bisect(fun,a,b,eps)
n  = 1+round((log(b-a)-log(eps))/log(2))
fa = feval(fun,a);
fb = feval(fun,b);
for i = 1:n
    c = (b+a)/2; fc = feval(fun,c);
    if fc*fa<0
        b=c; fb = fc;
    else
        a=c; fa = fc;
    end
end
root = c;