%����ɭ��ʽ����ʵ����ţ�ٿ�˼�ع�ʽȡ2�ε����
function y=demo_simpInt(fun,min,max)
% format long;
funmin=subs(sym(fun), symvar(sym(fun)),min);    
funmax=subs(sym(fun), symvar(sym(fun)),max);  
funmid=subs(sym(fun), symvar(sym(fun)),(min+max)/2);  
y=(max-min)/6*(funmin+4*funmid+funmax);%����ɭ��ʽ��ֱ���ճ�