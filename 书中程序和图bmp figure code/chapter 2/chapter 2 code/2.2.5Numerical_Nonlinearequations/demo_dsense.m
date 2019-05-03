function demo_dsense
clc; clear all; format long;
x0 = [-1.5 6.5 -5.0];
[x n f]=dsense(x0)
end


function [x n f] = dsense(x0)
eps=1.0e-6;
x = x0;
[f f2 g g2] = myfun(x);
lamda = f2/g2;
x = x - lamda*g;
n =0;
while(norm(x-x0)>=eps)
    x0 = x; n = n+1;
   [f f2 g g2] = myfun(x);
    lamda = f2/g2;
    x = x - lamda*g;
   if(n>100000)
        disp('迭代步数太多，可能不收敛！');
        return;
    end
end
end

function [f f2 g g2] = myfun(x)
f(1) = x(1)-5*x(2)*x(2)+7*x(3)*x(3)+12;
f(2) = 3*x(1)*x(2)+x(1)*x(3)-11*x(1);
f(3) = 2*x(2)*x(3)+40*x(1);
f = [f(1) f(2) f(3)];
f2 = f(1)*f(1)+f(2)*f(2)+f(3)*f(3);
g(1) = 2*f(1)+2*f(2)*(3*x(2)+x(3)-11)+2*40*f(3);
g(2) = 2*f(1)*(-10*x(2))+2*f(2)*(3*x(1))+2*f(3)*(2*x(3));
g(3) = 2*f(1)*(14*x(3))+2*f(2)*(x(1))+2*f(3)*(2*x(2));
g = [g(1) g(2) g(3)];
g2 = g(1)*g(1)+g(2)*g(2)+g(3)*g(3);
end




        

