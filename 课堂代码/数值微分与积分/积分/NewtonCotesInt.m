%牛顿柯思特公式(取8次),其实就是用拉格朗日插值公式来求积分
function y=NewtonCotesInt(fun,min,max)
format long;
coefficient=[989/28350,5888/28350,-928/28350,10496/28350,-4540/28350,10496/28350,-928/28350,5888/28350,989/28350];%对应的系数
x=min:(max-min)/(length(coefficient)-1):max;
y=0;
for i=1:length(coefficient)
    f=subs(sym(fun), symvar(sym(fun)),x(i));
    y=y+coefficient(i)*f;
end
y=(max-min)*y;