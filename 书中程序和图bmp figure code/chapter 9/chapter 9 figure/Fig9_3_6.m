% demo_fem_4.m 解轴对称 Laplace 方程： 
function demo_fem_4
clc;clear;
nel=10;	% 单元数 
nnel=3;	% 每个单元节点数 
ndof=1;	% 每个节点自由度数 
nnode=12;	% 系统总节点数 
sdof=nnode*ndof;	% 系统总自由度数 
% 输入系统节点坐标 
% gcoord(i j) i：节点编号；j：= 1：表示r坐标，= 2：表示z坐标 
gcoord(1:2:11,1) = 4:0.4:6; gcoord(1:2:11,2) = 0;
gcoord(2:2:12,1) = 4:0.4:6; gcoord(2:2:12,2) = 1;
% 输入每个单元节点编号;nodes(i j) i：单元编号j：单元节点
nodes(1:2:9,1) = 1:2: 9; nodes(2:2:10,1) = 1:2: 9;
nodes(1:2:9,2) = 4:2:12; nodes(2:2:10,2) = 3:2:11;
nodes(1:2:9,3) = 2:2:10; nodes(2:2:10,3) = 4:2:12;
% 输入边界条件 
bcdof(1)=1; bcval(1)=100;	% 约束的第一个节点和值 
bcdof(2)=2; bcval(2)=100;	% 约束的第二个节点和值 
% 初始化矩阵和矢量 
ff=zeros(sdof,1);	        % initialization of system force vector 
kk=zeros(sdof,sdof);	    % initialization of system matrix 
index=zeros(nnel*ndof,1);	% initialization of index vector 
% 
pi=4*atan(1);	% define pi 
ff(11)=120*pi;  % 柱外节点通量
ff(12)=120*pi; 
% nodal flux at the outside boundary 
for iel=1:nel % loop for the total number of elements 
nd(1)=nodes(iel,1); nd(2)=nodes(iel,2); nd(3)=nodes(iel,3);  
r1=gcoord(nd(1),1);z1=gcoord(nd(1),2);	% coordinate of 1st node 
r2=gcoord(nd(2),1);z2=gcoord(nd(2),2);	% coordinate of 2nd node 
r3=gcoord(nd(3),1);z3=gcoord(nd(3),2);	% coordinate of 3rd node 
index=feeldof(nd,nnel,ndof);	% extract system dofs for the element 
% 
k=felpaxt3(r1,z1,r2,z2,r3,z3);	% 计算单元矩阵 
kk=feasmbl1 (kk,k,index);       % 装配系统矩阵
end 
[kk,ff]=feaplyc2(kk,ff,bcdof,bcval); % 应用边界条件 
fsol=kk\ff;                          % 解矩阵方程
% 计算解析解 
for i=1:nnode 
r=gcoord(i,1); z=gcoord(i,2); 
esol(i)=100-6*20*log(4)+6*20*log(r); 
end 
% 输出解析解和数值解 
num=1:1:sdof; 
store=[num' fsol esol'] 
fsol2=reshape(fsol,2,6);
figure;
set(gca,'FontSize',16);
surf(fsol2);
xlabel('r'); ylabel('z');zlabel('u(r,z)');
%title('图9.3-6：例题9.3-2：轴对称Laplace方程数值解');
end

function [k]=felpaxt3(r1 ,z1 ,r2,z2,r3,z3) 
% 轴对称 Laplace 方程的单元矩阵 
% к - 单元刚性矩阵(3x3) 
A=0.5*(r2*z3+r1*z2+r3*z1-r2*z1-r1*z3-r3*z2); % 三角形单元面积 
rc=(r1+r2+r3)/3;	% 单元中心 r坐标值
twopirc=8*atan(1)*rc; 
k(1,1)=((r3-r2)*(r3-r2)+(z2-z3)*(z2-z3))/(4*A); 
k(1,2)=((r3-r2)*(r1-r3)+(z2-z3)*(z3-z1))/(4*A); 
k(1,3)=((r3-r2)*(r2-r1)+(z2-z3)*(z1-z2))/(4*A); 
k(2,1)=k(1,2); 
k(2,2)=((r1-r3)*(r1-r3)+(z3-z1)*(z3-z1))/(4*A); 
k(2,3)=((r1-r3)*(r2-r1)+(z3-z1)*(z1-z2))/(4*A); 
k(3,1)=k(1,3); 
k(3,2)=k(2,3); 
k(3,3)=((r2-r1)*(r2-r1)+(z1-z2)*(z1-z2))/(4*A); 
k=twopirc*k; 
end
