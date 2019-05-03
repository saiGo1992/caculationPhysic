% secant.m
function [root n] = secant(f,x0,x1,eps,nmax)
dx = x1-x0; n = 0;
while((abs(dx)>=eps) & (n<=nmax))
    x2 = x1-f(x1)*(x1-x0)/(f(x1)-f(x0));
    if(f(x0)*f(x2)>0)
        dx = x2 -x0;
	    x0 = x2;
    else
        dx = x2 - x1;
        x1 = x2 ;     
    end 
    n=n+1;
end
root = x2; 
