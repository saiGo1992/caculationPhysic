%m�׶���ʽ���
%mΪ������x��yΪ��Ҫ��ϵ�����
function a=multifit(x,y,m)
n=length(x);
S=zeros(m+1);%m*m����
T=zeros(m+1,1);%m*1����

for i=1:m+1 %���������������Ԫ��
    for j=i:i+m %���ݰ�����ε���
        %����S(i,j)��T(j,1)
        c=0;
        p=0;
        for k=1:n
            c=c+x(k)^(j-1);
            if i==1 %ֻ�е�һ��ʱ��ź��������о���TԪ��
               p=p+x(k)^(j-1)*y(k); 
            end
        end
        S(i,j-i+1)=c; %��λ�ü��ص�ǰ�е���С����
        if i==1 %ֻ�е�һ��ʱ��ź��������о���TԪ��
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
