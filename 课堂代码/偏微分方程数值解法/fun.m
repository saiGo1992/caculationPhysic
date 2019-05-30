function y = fun (t, u)
n=15;
x(1) = -2*u(1) + u(2);
x(n-1) = u(n-2) - 2*u(n-1);
x(2:n-2) = u(1:n-3) -2*u(2:n-2)+u(3:n-1);
y=x';
end
