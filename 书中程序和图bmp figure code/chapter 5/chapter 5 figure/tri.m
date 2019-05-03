function x=tri(a,b,c,f)
n=length(f);
x=zeros(1,n); y=zeros(1,n);
d=zeros(1,n); u=zeros(1,n);
d(1)=b(1);
for i=1:n-1
    u(i)=c(i)/d(i);
    d(i+1)=b(i+1)-a(i+1)*u(i);
end
% ×·
y(1)=f(1)/d(1);
for i=2:n
    y(i)=(f(i)-a(i)*y(i-1))/d(i);
end
% ¸Ï
x(n)=y(n);
for i=n-1:-1:1
    x(i)=y(i)-u(i)*x(i+1);
end
    

