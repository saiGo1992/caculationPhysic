%m阶多项式拟合
%m为阶数，x，y为需要拟合的数据
function a=multifit(x,y,m)
n=length(x);
S=zeros(m+1);%m*m矩阵
T=zeros(m+1,1);%m*1向量

for i=1:m+1 %按行生成所需矩阵元素
    for j=i:i+m %次幂按行逐次递增
        %生成S(i,j)和T(j,1)
        c=0;
        p=0;
        for k=1:n
            c=c+x(k)^(j-1);
            if i==1 %只有第一行时候才合适生成列矩阵T元素
               p=p+x(k)^(j-1)*y(k); 
            end
        end
        S(i,j-i+1)=c; %列位置减回当前行的最小次幂
        if i==1 %只有第一行时候才合适生成列矩阵T元素
           T(j,1)=p;
        end
    end
end
a=flip((S^-1*T));






% c(1:(2*m+1))=0;
% T(1:(m+1))=0;
% for j=1:(2*(m+1))
%     for k=1:n
%         c(j)=c(j)+x(k)^(j-1);
%         if (j<(m+2))
%             T(j)=T(j)+y(k)*x(k)^(j-1);
%         end
%     end
% end
% S(1,:)=c(1:(m+1));
% for k=2:(m+1)
%     S(k,:)=c(k:(m+k));
% end
% a=S/T;
