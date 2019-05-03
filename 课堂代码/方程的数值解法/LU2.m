function[L, U] = LU2(a)
[n, m]=size(a);
L=eye(n); U=zeros(n);
for k=1:n %����U�ǵ�k�У�����L�ǵ�k��
    %����Ԫ
%     t=0;%�洢����u(x,x)
%     h=0;%�洢�����б��
%     for i=k:n
%         %��k�е���n��,��������k
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
%     %����
%     if h>k
%        z=a(k,:); a(k,:)=a(h,:); a(h,:)=z;
%     end
    %����U����Ԫ��U(k,j) ��k��
    for j=k:n 
        z=0; %�����洢�ۼ���
        for p=1:k-1 %����U�����������Ǿ������±�k���������±�j�������ۼ��������±��1(k-1)Ϊ��׼
            z=z+L(k,p)*U(p,j);
        end
        U(k,j)=a(k,j)-z;
    end
    if abs(U(k, k))<1e-6
       return;
    end
    %����L����Ԫ��L(i,k) ��k��
    for i=k+1:n
        z=0;
        for p=1:k-1
            z=z+L(i,p)*U(p,k);
        end
        L(i,k)=(a(i,k)-z)/U(k,k);
    end
end
