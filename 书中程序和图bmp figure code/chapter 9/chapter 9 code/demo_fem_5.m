function  demo_fem_5
clear;clc;format long;
% input data for control parameters 
deltt=0.01;       % 时间步长(原来是0.1)
stime=0.0;        % 初始时间
ftime=2;          % 结束时间
ntime=fix((ftime-stime)/deltt); % 时间间隔数
xa=0;             % 空间区域的左边界
xb=5;             % 空间区域的右边界
ya=0;             % 空间区域的下边界
yb=2;             % 空间区域的上边界
lx=16;             % x方向的单元数（原来是4）
ly=4;             % y方向的单元数（原来是2）
nx=lx+1;          % x方向的节点数
ny=ly+1;          % y方向的节点数
dx = (xb-xa)/lx; dy = (yb-ya)/ly;

nel=2*lx*ly;      % 单元数
nnel=3;           % 每个单元的节点数 
ndof=1;           % 每个节点的自由度数
nnode=nx*ny;      % 系统总节点数
sdof=nnode*ndof;  % 系统总自由度数

gcoord= zeros(nx*ny,2);   % 节点坐标初始化
nodes = zeros(lx*ly*2,3); % 节点编号初始化
% 计算节点坐标和节点编号
[gcoord nodes] =nodes3p2c(gcoord,nodes,xa,xb,ya,yb,lx,ly);
% input data for boundary conditions 
 % 给出边界点的编号和取值
ul = 100;   % 左边界
ur = 100;   % 右边界
[bcdof,bcval] = bc_lr(nx,ny,ul,ur);


ff=zeros(sdof,1);	% initialization of system vector 
fn=zeros(sdof,1);	% initialization of effective system vector 
fsol=zeros(sdof,1);	% solution vector 
sol=zeros(2,ntime+1);	% vector containing time history solution 
kk=zeros(sdof,sdof);	% initialization of system matrix 
mm=zeros(sdof,sdof);	% initialization of system matrix 
index=zeros(nnel*ndof,1);	% initialization of index vector 
% computation of element matrices and vectors and their assembly 
%	 
for iel=1:nel	% loop for the total number of elements 
% 
nd(1)=nodes(iel,1);	% 1st connected node for (iel)-th element 
nd(2)=nodes(iel,2);	% 2nd connected node for (iel)-th element 
nd(3)=nodes(iel,3);	% 3rd connected node for (iel)-th element 
x1=gcoord(nd(1),1); y1=gcoord(nd(1),2); % coord values of 1st node 
x2=gcoord(nd(2),1); y2=gcoord(nd(2),2); % coord values of 2nd node 
x3=gcoord(nd(3),1); y3=gcoord(nd(3),2); % coord values of 3rd node 
index=feeldof(nd,nnel,ndof);	% extract system dofs for the element 
k=felp2dt3(x1,y1,x2,y2,x3,y3);	% compute element matrix 
m=felpt2t3(x1,y1,x2,y2,x3,y3);	% compute element matrix 
kk=feasmbl1(kk,k,index);	% assemble element matrices 
mm=feasmbl1(mm,m,index);	% assemble element matrices 
end 
% loop for time integration 
%	. 
for in=1:sdof 
fsol(in)=0.0;	% initial condition 
end 
% 
sol(1,1)=fsol(8);	% store time history solution for node no. 8 
sol(2,1)=fsol(9);	% store time history solution for node no. 9 
% 
figure(1);
for it=1:ntime	                       % start loop for time integration 
fn=deltt*ff+(mm-deltt*kk)*fsol;	       % compute effective column vector 
[mm,fn]=feaplyc2(mm,fn,bcdof,bcval);   % apply boundary condition 
fsol=mm\fn;            	% solve the matrix equation 
sol(1,it+1)=fsol(8);	% store time history solution for node no. 8 
sol(2,it+1)=fsol(9);	% store time history solution for node no. 9 
    fsol2=reshape(fsol,nx,ny);
    surf(fsol2);
    zlim([-50 100]);
    pause(0.01);
    title('图9.4-2  例题9.4-1的运行结果');
end 

time=0:deltt:ntime*deltt; 
figure(2)
plot(time,sol(1,:),'*',time,sol(2,:),'-'); 
xlabel('Time') 
ylabel('Solution at nodes') 
end


function [m]=felpt2t3(x1,y1,x2,y2,x3,y3) 
% element matrix for transient term of two-dimensional 
% Laplace's equation using linear triangular element 
% m - element stiffness matrix (size of 3x3) 
% xl, yl - x and у coordinate values of the first node of element 
% x2, y2 - x and у coordinate values of the second node of element 
% x3, y3 - x and у coordinate values of the third node of element 
% element matrix 
A=0.5*(x2*y3+x1*y2+x3*y1-x2*y1-x1*y3-x3*y2); 
% area of the triangle 
m = (A/12)* [2 1 1;1 2 1;1 1 2]; 
end

function [k]=felp2dt3(x1,y1,x2,y2,x3,y3)
% element matrix for two-dimensional Laplace's equation 
% using three-node linear triangular element 
% к - element stiffness matrix (size of 3x3) 
% xl, yl - x and у coordinate values of the first node of element 
% x2, y2 - x and у coordinate values of the second node of element 
% x3, y3 - x and у coordinate values of the third node of element 
% element matrix 
A=0.5*(x2*y3+x1*y2+x3*y1-x2*y1-x1*y3-x3*y2); 
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
