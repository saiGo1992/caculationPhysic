%ţ�ٿ�˼�ع�ʽ(ȡ8��),��ʵ�������������ղ�ֵ��ʽ�������
function y=NewtonCotesInt(fun,min,max)
format long;
coefficient=[989/28350,5888/28350,-928/28350,10496/28350,-4540/28350,10496/28350,-928/28350,5888/28350,989/28350];%��Ӧ��ϵ��
x=min:(max-min)/(length(coefficient)-1):max;
y=0;
for i=1:length(coefficient)
    f=subs(sym(fun), symvar(sym(fun)),x(i));
    y=y+coefficient(i)*f;
end
y=(max-min)*y;