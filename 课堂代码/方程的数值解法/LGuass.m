%����Ԫ��˹��Ԫ������ÿһ�����ֵ��Ϊ��Ԫ������Ԫ���������
function x=LGauss(a, b)
[n,m]=size(a);%��ȡϵ�����������������
x=zeros(n,1);%�������������
%ѡ��Ԫ  
for k=1:n-1                                                   
    max1=0;
    %�ҳ�
    for i=k:n                                                                    
        if abs(a(i,k))>max1                                               
           max1=abs(a(i,k)); 
           r=i;                                       
        end                                                                       
    end                                                                           
    if max1 < 1e-10                                                          
        return;                                                                    
    end
    %��������
    if r > k                                                                        
       for j=k:n                                                                       
           z=a(k,j); a(k,j)=a(r,j); a(r,j)=z;
       end
       z=a(k);
       b(k)=b(r);
       b(r)=z;
    end
    %��Ԫ����
    for i=k+1:n
       m1=a(i,k)/a(k,k);
       for j=k+1:n
           a(i,j)=a(i,j)-m1*a(k,j);
       end
       b(i)=b(i)-m1*b(k);
    end
end
for k=n:-1:1     %�ش����   
    for j=k+1:n
        b(k)=b(k)-a(k,j)*x(j);
    end
    x(k)=b(k)/a(k,k);
end

    