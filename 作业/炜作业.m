%ì¿-×÷Òµ
%y''+y=0
clc;
clear all;
h=pi/8;
n=ceil(pi/2/h+1);
u(1:n)=1;
v(1:n)=0;
w(1:n)=1;
f(1:n)=0;
a(1:n)=u(1:n)+0.5*h*v(1:n);
b(1:n) = h*h*w(1:n)-2*u(1:n);
c(1:n) = u(1:n)+0.5*h*v(1:n);
d(1:n) = h*h*f(1:n);
a(1)=0;b(1)=1-1/h;c(1)=1/h;d(1)=1;
a(n)=-1/h;b(n)=1+1/h;c(n)=0;d(n)=0;
m1=diag(a(2:n),-1);
m2=diag(b);
m3=diag(c(1:n-1),1);
m=m1+m2+m3;
plot(m^-1*d.',0:pi/8:pi/2);
