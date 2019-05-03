%辛普森公式，其实就是牛顿柯思特公式取2次的情况
function y=demo_simpInt(fun,min,max)
% format long;
funmin=subs(sym(fun), symvar(sym(fun)),min);    
funmax=subs(sym(fun), symvar(sym(fun)),max);  
funmid=subs(sym(fun), symvar(sym(fun)),(min+max)/2);  
y=(max-min)/6*(funmin+4*funmid+funmax);%辛普森公式，直接照抄