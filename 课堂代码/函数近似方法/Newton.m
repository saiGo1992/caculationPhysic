function s = Newton(x, y, nn,x0)
% Newton插值， x与y为已知的插值点及其函数值
% x0为要求的插值点的x坐标值，nn为Newton插值多项式的阶数
nx = length(x);
ny = length(y); 
if nx ~= ny
   warning( '矢量x与y的长度应该相同');
   return;
end
if nn > ny-1
   warning( '阶数过高');
   return;
end
%创建插值公式
yy = zeros(nn); %创建矩阵保存各级差商
for i = 1:nn %按列生成各级差商
    for j = 1:nn %每列按行生成
        %分母处规律均为(x(j-(i-1))-x(j+1))
        %一阶差商
        if i==1
           yy(j,i)=(y(j)-y(j+1))/(x(j-(i-1))-x(j+1));
        %二阶差商及以上
        elseif j>=i
           yy(j,i)=(yy(j-1,i-1)-yy(j,i-1))/(x(j-(i-1))-x(j+1));
        end
    end
end

%用得到的牛顿插值公式计算
m = length(x0);
q=diag(yy);%仅需用对角元素计算插值
t=y(1);
%按照公式，对要求的插值点x0的每个元素进行计算
for i = 1:m
    for j = 1:length(q)
        r=q(j);
        for p = 1:j
            r=r*(x0(i)-x(p));
        end
        t=t+r;
    end
    s(i)=t;
end
