%׷�Ϸ���ⷽ���飨ֻ���������Ǵ�״����
function x=tri2(a,b,c,f)
n=length(f);
e=zeros(1,n);
d=zeros(1,n);
x=zeros(1,n);
%����ϵ������׷
e(1)=c(1)/b(1);
d(1)=f(1)/b(1);
for i=2:n
    e(i)=c(i)/(b(i)-a(i)*e(i-1));
    d(i)=(f(i)-a(i)*d(i-1))/(b(i)-a(i)*e(i-1));
end    
%������������
k=n:-1:2;
for i=1:length(k)
    x(i)=(f(i)-a(i)*d(i-1))/(b(i)-a(i)*e(i-1));
end