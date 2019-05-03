function a = multifit(x,y,m)
%a--输出的拟合多项式的系数
n=length(x);
c(1:(2*m+1))=0; T(1:(m+1))=0;
for j=1:(2*m+1)          %求出c和b
    for k=1:n
        c(j)=c(j)+x(k)^(j-1);
        if(j<(m+2))
            T(j)=T(j)+y(k)*x(k)^(j-1);
        end
    end
end
S(1,:)=c(1:(m+1));
for k = 2:(m+1)
    S(k,:)=c(k:(m+k));
end
a = S\T'    %直接求解法求出拟合系数

