%换主元高斯消元法：用每一列最大值作为主元进行消元，减少误差
function x=LGauss(a, b)
[n,m]=size(a);%获取系数矩阵的行数与列数
x=zeros(n,1);%创建解的列向量
%选主元  
for k=1:n-1                                                   
    max1=0;
    %找出
    for i=k:n                                                                    
        if abs(a(i,k))>max1                                               
           max1=abs(a(i,k)); 
           r=i;                                       
        end                                                                       
    end                                                                           
    if max1 < 1e-10                                                          
        return;                                                                    
    end
    %交换两行
    if r > k                                                                        
       for j=k:n                                                                       
           z=a(k,j); a(k,j)=a(r,j); a(r,j)=z;
       end
       z=a(k);
       b(k)=b(r);
       b(r)=z;
    end
    %消元过程
    for i=k+1:n
       m1=a(i,k)/a(k,k);
       for j=k+1:n
           a(i,j)=a(i,j)-m1*a(k,j);
       end
       b(i)=b(i)-m1*b(k);
    end
end
for k=n:-1:1     %回代求解   
    for j=k+1:n
        b(k)=b(k)-a(k,j)*x(j);
    end
    x(k)=b(k)/a(k,k);
end

    