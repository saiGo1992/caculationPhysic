%ÀýÌâ£ºÀ©É¢·½³Ì
%rou(u)/rou(t) = a*rou^2(u)/rou(x^2), u(x,0)=sin(x), u(pi,t)=0
function demo_MOL
clc; clear all; 
format long;
n=15; 
dpi=pi/n;
x=dpi:dpi:pi-dpi;
u=sin(x);
t=0:0.4:40;
[t,u]= ode45(@fun, t, u);
uu (:, 2:n) =u (:, 1 :n-1);
uu (:, 1) = 0; 
uu( :, n+1) =0;
x = [0 x pi]; 
[xx,yy] = meshgrid (x, t);
set (gca, 'FontSize', 16);
surf (xx, yy, uu);
xlabel ('x'); ylabel ('t'); zlabel ('u(x,t)');
end
