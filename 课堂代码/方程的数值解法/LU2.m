function[L, U] = LU2(a)
[n, m]=size(a);
L=eye(n); U=zeros(n);
for k=1:n %对于U是第k行，对于L是第k列
    %换主元
%     t=0;%存储最大的u(x,x)
%     h=0;%存储最大的行标号
%     for i=k:n
%         %第k行到第n行,列数就是k
%         z=0;
%         for j=1:k-1
%             z=z+L(k,j)*U(j,k);
%         end
%         si=abs(a(i,k)-z);
%         if t<si
%            t=si;
%            h=i;
%         end
%     end
%     %换行
%     if h>k
%        z=a(k,:); a(k,:)=a(h,:); a(h,:)=z;
%     end
    %计算U矩阵元素U(k,j) 第k行
    for j=k:n 
        z=0; %用来存储累加项
        for p=1:k-1 %由于U矩阵是上三角矩阵，行下标k不大于列下标j，所以累加是以行下标减1(k-1)为标准
            z=z+L(k,p)*U(p,j);
        end
        U(k,j)=a(k,j)-z;
    end
    if abs(U(k, k))<1e-6
       return;
    end
    %计算L矩阵元素L(i,k) 第k列
    for i=k+1:n
        z=0;
        for p=1:k-1
            z=z+L(i,p)*U(p,k);
        end
        L(i,k)=(a(i,k)-z)/U(k,k);
    end
end
