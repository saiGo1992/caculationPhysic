function T = TrapInt1(f,a,b,nsub)
n = nsub + 1;         % nsun-��������n-�ܽڵ���
h = (b-a)/nsub;       %    h-���䲽��
x = a:h:b;             %    x-�ڵ�����
y = f(x);              %    y-�ڵ㺯��ֵ; 
T = h * ( 0.5*y(1) + sum(y(2:n-1)) + 0.5*y(n) );
end



