function int = trapezc(fun,a,b,m)
h=(b-a)/m; 
x=[a:h:b]; 
dim = max(size(x)); 
y = feval(fun,x); 
if size(y)==1
    y=diag(ones(dim))*y; 
end 
int=h*(0.5*y(1)+sum(y(2:m))+0.5*y(m+1));
