function x=tri0(a,b,c,f)
% a(1:n-1);b(1:n);c(1:n-1);f(1:n)
n = length(f);
for(i=2:n)  
    b(i)=b(i) - (a(i-1)/b(i-1))*c(i-1);   
    f(i)=f(i) - (a(i-1)/b(i-1))*f(i-1);
end
x(n) = f(n)/b(n);
for(i=(n-1):-1:1)
    x(i) = (f(i)-c(i)*x(i+1))/b(i);
end 
