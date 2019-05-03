%
% Code to determine Bessel functions of order 1/2.
%
clc;
xa = 0; xb = 10; dx = 0.1;
ya = 0; yap = 1;
x=xa:dx:xb; n = length(x);
y = zeros(size(x));
y(1) = ya; y(2) = y(1) + dx * yap;
for j = 2:n-1
temp = x(j)*(x(j)+0.5*dx);
y(j+1) = ((2*x(j)*x(j)-dx*dx*x(j)*x(j)+...
    0.25*dx*dx)*y(j)+x(j)*(0.5*dx-x(j))*y(j-1))/temp;
end
figure(1);
set(gca,'FontSize',16);
plot(x,y,'linewidth',2);grid on;
xlabel('x'); ylabel('J_{1/2}(x)');
title('Í¼5.2-6  ÀýÌâ5.2.6º¯ÊýÍ¼Ïñ');
