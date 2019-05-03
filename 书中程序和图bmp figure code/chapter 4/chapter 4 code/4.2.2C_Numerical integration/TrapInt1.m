function T = TrapInt1(f,a,b,nsub)
n = nsub + 1;         % nsun-区间数，n-总节点数
h = (b-a)/nsub;       %    h-区间步长
x = a:h:b;             %    x-节点坐标
y = f(x);              %    y-节点函数值; 
T = h * ( 0.5*y(1) + sum(y(2:n-1)) + 0.5*y(n) );
end



