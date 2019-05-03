%�������
function [a,b] = linearfit (x, y)
    n = length (x);
    sx=sum(x);%�����Ա����ۼ�
    sy=sum(y);%����������ۼ�
    xx=x.*x;%�����Ա��������Լ�����
    xy=x.*y;%�Ա����������һһ��Ӧ��˼���
    sxx=sum(xx);%�Ա����Գ�֮��
    sxy=sum(xy);%�Ա������������֮��
    deno=n*sxx-sx^2;%��ĸ��ͬ
    a=(n*sxy-sx*sy)/deno;%һ�ν���xǰ���ϵ��
    b=(sy*sxx-sxy*sx)/deno;
%     x2 = x.*x; 
%     xy = x.*y;
%     sx = sum(x); sy = sum(y);
%     sxy = sum (xy); sx2 = sum (x2);
%     deno = n*sx2-sx*sx;
%     a = (sy*sx2-sx*sxy)/deno;
%     b = (n*sxy-sx*sy)/deno;
end
