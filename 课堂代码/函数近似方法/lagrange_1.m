%拉格朗日插值程序
%基本思想：根据样本数据计算出插值的拉格朗日函数，然后代入插值点算出对应的y值
%L_n(拉格朗日n次插值函数)公式(3次为例):
%样本数据(x0,y0),(x1,y1),(x2,y2)
%l0=(x-x1)(x-x2)/((x0-x1)(x0-x2))
%l1=(x-x0)(x-x2)/((x1-x0)(x1-x2))
%l2=(x-x0)(x-x1)/((x2-x0)(x2-x1))
%  L3=l0*y0+l1*y1+l2*y2
function v = lagrange_1(x, y, u)
% x 插值点
% y 插值
% u 计算序列点(就是需要插值的x点)
% v  计算序列点值(对应插值x点的y值)
% 整个矩阵计算，一步到位
n = length (x);
v = zeros(size(u));
for k =1:n
    w = ones (size(u));
    for j = [1:k-1 k+1:n] %这个遍历跳过了k
        w = (u-x(j))./(x(k)-x(j)).*w;
    end
    v = v+w*y(k);
end
