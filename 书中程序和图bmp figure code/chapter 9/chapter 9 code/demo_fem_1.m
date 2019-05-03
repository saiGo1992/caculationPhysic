%example demo_fem_1.m
function demo_fem_1
clc;clear all; format long;
nel   = 15;       % 单元数
nnel  = 2;        % 每个单元的节点数
ndof  = 1;        % 每个节点的自由度数
nnode = nel+1;    % 系统总的节点数
sdof=nnode*ndof;  % 总系统自由度数
% 输入节点坐标值
xa = 0.0; xb = 1.0; dx = (xb-xa)/nel;
gcoord(1:nnode) = xa:dx:xb;
% 输入节点的编号
nodes(1:nel,1)=1:nel; nodes(1:nel,2)=2:nel+1;
% 输入微分方程的系数a,b,c
acoef=1; bcoef=-3; ccoef=2;
% 输入边界条件
bcdof(1)=1; bcval(1)=0;     % 表示第1个边界节点编号是1，对应的值是0
bcdof(2)=nnode; bcval(2)=0; % 表示第2个边界节点编号是nnode，对应的值是0
% 初始化单元的矩阵和矢量
ff = zeros(sdof,1);         % ff是系统的矢量
kk = zeros(sdof,sdof);      % kk是系统的矩阵
index = zeros(nnel*ndof,1); % 
% 计算单元矩阵和矢量及装配
for iel=1:nel; % 对所有单元循环
    nl=nodes(iel,1);nr=nodes(iel,2); % 抽出第iel单元的两个节点
    xl=gcoord(nl);xr=gcoord(nr);     % 抽出第iel单元的两个节点的坐标 
    eleng=xr-xl;  % 第iel单元的长度
    index=feeldof1(iel,nnel,ndof);
    k=feode2l(acoef,bcoef,ccoef,eleng); % 计算第iel单元的矩阵
    f=fef1l(xl,xr);                     % 计算第iel单元的矢量
    [kk,ff]=feasmbl2(kk,ff,k,f,index);  % 装配单元矩阵和矢量
end
% 应用边界条件
[kk,ff]=feaplyc2(kk,ff,bcdof,bcval);
% 解矩阵方程
fsol=kk\ff;
% 解析解
c1=0.5/exp(1); c2=-0.5*(1+1/exp(1));
for i=1:nnode
    x=gcoord(i); esol(i)=c1*exp(2*x)+c2*exp(x)+1/2;
end
% 输出精确解和有限元解
num=1:1:sdof;
results = [num' fsol esol'];
plot(num,fsol,'rs',num,esol,'k-');
legend('解析解','数值解');
title('图9.2-1  d^2u/dx^2-3du/dx+2u=1,u(0)=0,u(1)=0有限元方法');
end

% 应用约束到矩阵方程[kk]x=ff
function [kk,ff]=feaplyc2(kk,ff,bcdof,bcval)
n=length(bcdof); sdof=size(kk);
for i=1:n
    c=bcdof(i);
    for j=1:sdof
        kk(c,j)=0;
    end
    kk(c,c)=1; ff(c)=bcval(i);
end
end
%单元矩阵和矢量装配成系统矩阵和矢量
function [kk,ff]=feasmbl2(kk,ff,k,f,index)
edof=length(index);
for i=1:edof
    ii=index(i); ff(ii)=ff(ii)+f(i);
    for j=1:edof
        jj=index(j); kk(ii,jj)=kk(ii,jj)+k(i,j);
    end
end
end
% 计算与每个单元相联系的系统自由度
function [index] = feeldof1(iel,nnel,ndof)
edof=nnel*ndof;
start = (iel-1)*(nnel-1)*ndof;
for i=1:edof
    index(i)=start+i;
end
end
% 对应于f(x)=1的单元矢量
function [f]=fef1l(xl,xr)
eleng = xr - xl;
f=[eleng/2; eleng/2];
end
% 单元矩阵
function [k]=feode2l(acoef,bcoef,ccoef,eleng)
a1=-(acoef/eleng);a2=bcoef/2;a3=ccoef*eleng/6;
k=[a1-a2+2*a3 -a1+a2+a3; -a1-a2+a3 a1+a2+2*a3];
end
