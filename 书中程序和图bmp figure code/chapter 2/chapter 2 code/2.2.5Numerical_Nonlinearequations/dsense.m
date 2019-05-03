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
        disp('迭代次数太多，可能不收敛！');
        return;
    end
end
end


