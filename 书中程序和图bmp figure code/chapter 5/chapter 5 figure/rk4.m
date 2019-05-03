function y = rk4(f,a,b,ya,n)
h = (b-a)/n;
x = a:h:b;
y(1) = ya;
for i = 1:n
    k1 = h*f(x(i),y(i));
    k2 = h*f(x(i)+h/2,y(i)+k1/2);
    k3 = h*f(x(i)+h/2,y(i)+k2/2);
    k4 = h*f(x(i)+h,y(i)+k3);
    y(i+1) = y(i)+(k1+2*k2+2*k3+k4)/6;
end
