% diffu_explicit.m
clc; clear all;
nl = 20.; nt = 40;
dx = 0.5; dt = 0.1; kp = 0.835;
lamda = kp*dt/dx/dx;
Tl = 0.; Tr = 100.;
T = zeros(nl,nt);
T(1,:) = Tl; T(nl,:)=Tr;
for j=1:nt-1
	for i =2:nl-1
	    T(i,j+1)=T(i,j)+lamda*(T(i+1,j)-2.*T(i,j)+T(i-1,j));
    end
end
surf(T');
xlabel('x');ylabel('time');zlabel('Temperature');
title('explicit scheme');
