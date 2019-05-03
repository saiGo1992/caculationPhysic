function demo_fem_3_2
clc;clear;format long;
a = 0.1;
xmin = 0; xmax = 20; ymin = 0; ymax = 10;
nx = 21; ny = 41;          % x,y 方向的格点数
dx = (xmax-xmin)/(nx-1); dy = (ymax-ymin)/(ny-1);
nel = 2*(nx-1)*(ny-1);     % 总单元数
nnel=3;                    % 每个单元的节点数
ndof=1;                    % 每个节点的自由度数
nnode = nx*ny;             % 总节点数
sdof=nnode*ndof;           % 总自由度数
 % 计算节点x,y坐标
gcoord = triangle_gcoord(xmin,xmax,ymin,ymax,nx,ny);
% 给出每个单元三个节点的编号
nodes = tri_nodes(nx,ny);
 % 给出边界点的编号和取值
ub = zeros(1:nx,1);   % 下边界
ul = zeros(1:ny-1,1); % 左边界
x = dx:dx:xmax;
ut = 100*sin(a*pi*x); % 上边界
[bcdof,bcval] = bc_blt(nx,ny,ub,ul,ut);

   ff = zeros(sdof,1);         % 初始化系统力矢量
   kk = zeros(sdof,sdof);      % 初始化系统矩阵
index = zeros(nnel*ndof,1);


for iel=1:nel
    nd(1)=nodes(iel,1);
    nd(2)=nodes(iel,2);
    nd(3)=nodes(iel,3);
    x1=gcoord(nd(1),1);y1=gcoord(nd(1),2);
    x2=gcoord(nd(2),1);y2=gcoord(nd(2),2);
    x3=gcoord(nd(3),1);y3=gcoord(nd(3),2);
    index=feeldof(nd,nnel,ndof);
    k=felp2dt3(x1,y1,x2,y2,x3,y3);  % 计算单元矩阵
    kk=feasmbl1(kk,k,index);        % 装配系统矩阵
end

[kk,ff]=feaplyc2(kk,ff,bcdof,bcval);   % 应用边界条件
fsol=kk\ff;                             % 解矩阵方程
% analytical solution 
for i=1:nnode
    x=gcoord(i,1);y=gcoord(i,2);
    esol(i)=100*sinh(0.31415927*y)*sin(0.31415927*x)/sinh(3.1415927);
end

% print both exact and fem solutions 
num=1:1:sdof;
store = [num' fsol esol'];
fsol1 = reshape(esol,nx,ny);
fsol2 = reshape(fsol,nx,ny);
figure(1);
surf(fsol1);
figure(2);
surf(fsol2);
end

function [kk]=feasmbl1(kk,k,index) 
% Purpose: 
% Assembly of element matrices into the system matrix 
% 
% Synopsis: 
% [kk]=feasmbll(kk,k,index) 
% 
% Variable Description: 
% kk - system matrix 
% к - element matri 
% index - d.o.f. vector associated with an element 
edof = length(index); 
for i=1:edof 
    ii=index(i);
    for j=1:edof 
        jj=index(j);
        kk(ii,jj)=kk(ii,jj)+k(i,j);
    end
end
end
        
function [index]=feeldof(nd,nnel,ndof) 
% Purpose: 
% Compute system dofs associated with each element 
% 
% Synopsis: 
% [index]=feeldof(nd,nnel,ndof) 
% 
% Variable Description: 
% index - system dof vector associated with element iel 
% nd - element node numbers whose system dofs are to be determined 
% nnel - number of nodes per element 
% ndof - number of dofs per node 
edof = nnel*ndof; 
k=0; 
for i=1:nnel
    start = (nd(i)-1)*ndof; 
    for j=1:ndof
        k=k+1;
        index(k)=start+j;
    end
end
end
        
function [k]=felp2dt3(x1,y1,x2,y2,x3,y3)
% Purpose: 
% element matrix for two-dimensional Laplace's equation 
% using three-node linear triangular element 
% 
% Synopsis: 
% [k]=felp2dt3(xl,yl,x2,y2,x3,y3) 
% 
% Variable Description: 
% к - element stiffness matrix (size of 3x3) 
% xl, yl - x and у coordinate values of the first node of element 
% x2, y2 - x and у coordinate values of the second node of element 
% x3, y3 - x and у coordinate values of the third node of element 
% element matrix 
A=0.5*(x2*y3+x1*y2+x3*y1-x2*y1-x1*y3-x3*y2);   % 三角形单元面积
%	% area of the triangle 
k(1,1)=((x3-x2)*(x3-x2)+(y2-y3)*(y2-y3))/(4*A); 
k(1,2)=((x3-x2)*(x1-x3)+(y2-y3)*(y3-y1))/(4*A); 
k(1,3)=((x3-x2)*(x2-x1)+(y2-y3)*(y1-y2))/(4*A); 
k(2,1)=k(1,2);
k(2,2)=((x1-x3)*(x1-x3)+(y3-y1)*(y3-y1))/(4*A); 
k(2,3)=((x1-x3)*(x2-x1)+(y3-y1)*(y1-y2))/(4*A); 
k(3,1)=k(1,3);
k(3,2)=k(2,3); 
k(3,3)=((x2-x1)*(x2-x1)+(y1-y2)*(y1-y2))/(4*A); 
end

function [kk,ff]=feaplyc2(kk,ff,bcdof,bcval) 
% Purpose: 
% Apply constraints to matrix equation [kk]x=ff 
% 
% Synopsis: 
% [kk,ff]=feaplybc(kk,ff,bcdof,bcval) 
% 
% Variable Description: 
% kk - system matrix before applying constraints 
% ff - system vector before applying constraints 
% bcdof - a vector containing constrained d.o.f 
% bcval - a vector containing constrained value 
% 
% For example, there are constraints at d.o.f=2 and 10 
% and their constrained values are 0.0 and 2.5, 
% respectively. Then, bcdof(l)=2 and bcdofB)=10; and 
% bcval(l)=1.0 and bcvalB)=2.5. 
%	,,->.-, ,	_	.	 
n=length(bcdof); 
sdof=size(kk); 
for i=1:n 
c=bcdof(i); 
for j=1:sdof 
kk(c,j)=0; 
end 
kk(c,c)=1; 
ff(c)=bcval(i); 
end 
end








