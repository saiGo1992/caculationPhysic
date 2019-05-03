function s = Newton(x, y, nn,x0)
% Newton��ֵ�� x��yΪ��֪�Ĳ�ֵ�㼰�亯��ֵ
% x0ΪҪ��Ĳ�ֵ���x����ֵ��nnΪNewton��ֵ����ʽ�Ľ���
nx = length(x);
ny = length(y); 
if nx ~= ny
   warning( 'ʸ��x��y�ĳ���Ӧ����ͬ');
   return;
end
if nn > ny-1
   warning( '��������');
   return;
end
%������ֵ��ʽ
yy = zeros(nn); %�������󱣴��������
for i = 1:nn %�������ɸ�������
    for j = 1:nn %ÿ�а�������
        %��ĸ�����ɾ�Ϊ(x(j-(i-1))-x(j+1))
        %һ�ײ���
        if i==1
           yy(j,i)=(y(j)-y(j+1))/(x(j-(i-1))-x(j+1));
        %���ײ��̼�����
        elseif j>=i
           yy(j,i)=(yy(j-1,i-1)-yy(j,i-1))/(x(j-(i-1))-x(j+1));
        end
    end
end

%�õõ���ţ�ٲ�ֵ��ʽ����
m = length(x0);
q=diag(yy);%�����öԽ�Ԫ�ؼ����ֵ
t=y(1);
%���չ�ʽ����Ҫ��Ĳ�ֵ��x0��ÿ��Ԫ�ؽ��м���
for i = 1:m
    for j = 1:length(q)
        r=q(j);
        for p = 1:j
            r=r*(x0(i)-x(p));
        end
        t=t+r;
    end
    s(i)=t;
end
