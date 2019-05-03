%��˹��Ԫ��
function X=Gauss(a, b)
[n,m]=size(a); %��ȡҪ���ľ��������������
x=zeros(n,1);  %����������
for k=1:n-1    %������
   for i=k+1:n %���α���k+1��n
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
for k=n:-1:1       %�ش����
     for j=k+1:n
         b(k)=b(k)-a(k,j)*x(j);
     end
     x(k)=b(k)/a(k,k);
end
x

