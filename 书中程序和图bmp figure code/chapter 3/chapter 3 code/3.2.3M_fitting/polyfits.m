function a =polyfits(x,y,m)
n=length(x);
d(1:(2*m+1))=0;
b(1:(m+1))=0;

for j=1:(2*m+1)          %求出d和b
    for k=1:n
        d(j)=d(j)+x(k)^(j-1);
        if(j<(m+2))
            b(j)=b(j)+y(k)*x(k)^(j-1);
        end
    end
end

c(1,:)=d(1:(m+1));
for s=2:(m+1)
    c(s,:)=d(s:(m+s));
end

a = gauss(c,b');        %高斯法求出拟合系数

