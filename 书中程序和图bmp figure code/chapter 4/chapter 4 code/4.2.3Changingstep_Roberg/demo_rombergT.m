function demo_rombergT
clc;clear all;
A = rombergT('f01',0,1,5)
end

function A = rombergT(fun,a,b,n)
for i=1:(n+1)
    A(i,1)=trapezc(fun,a,b,2^(i-1)); 
end
for j=2:(n+1)
    for i=j:(n+1)
        A(i,j)=(4^(j-1)*A(i,j-1)-A(i-1,j-1))/(4^(j-1)-1); 
    end
end
end

