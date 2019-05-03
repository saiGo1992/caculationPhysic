%线性拟合
function [a,b] = linearfit (x, y)
    n = length (x);
    sx=sum(x);%所有自变量累加
    sy=sum(y);%所有因变量累加
    xx=x.*x;%所有自变量乘以自己集合
    xy=x.*y;%自变量和因变量一一对应相乘集合
    sxx=sum(xx);%自变量自乘之和
    sxy=sum(xy);%自变量乘以因变量之和
    deno=n*sxx-sx^2;%分母相同
    a=(n*sxy-sx*sy)/deno;%一次近似x前面的系数
    b=(sy*sxx-sxy*sx)/deno;
%     x2 = x.*x; 
%     xy = x.*y;
%     sx = sum(x); sy = sum(y);
%     sxy = sum (xy); sx2 = sum (x2);
%     deno = n*sx2-sx*sx;
%     a = (sy*sx2-sx*sxy)/deno;
%     b = (n*sxy-sx*sy)/deno;
end
