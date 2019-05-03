% bvp_tri.m   Èý¶Ô½Ç¾ØÕó×·¸Ï·¨
function [a,b,c,d] = bvp1_tri(u,v,w,f,x1,xn,y1,yn,n)
h = (xn-x1)/(n-1);
x = x1:h:xn;
a = u(x)-0.5*h*v(x);
b = h*h*w(x)-2*u(x);
c = u(x)+0.5*h*v(x);
d = h*h*f(x);
a(1)=0;b(1)=1;c(1)=0;d(1)=y1;
a(n)=0;b(n)=1;c(n)=0;d(n)=yn;
y = tri(a,b,c,d)
plot(x,y);
end


