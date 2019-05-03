%高斯消元法
function X=Gauss(a, b)
[n,m]=size(a); %获取要求解的矩阵的行数和列数
x=zeros(n,1);  %建立解向量
for k=1:n-1    %遍历行
   for i=k+1:n %二次遍历k+1到n
       if a(k,k)==0
          return
       end
       m=a(i,k)/a(k,k);
       for j=k+1:n
           a(i,j)=a(i,j)-m*a(k,j);
       end
       b(i)=b(i)-m*b(k);
   end
end
for k=n:-1:1       %回代求解
     for j=k+1:n
         b(k)=b(k)-a(k,j)*x(j);
     end
     x(k)=b(k)/a(k,k);
end
x

