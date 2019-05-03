% demo_fem_4.m ����Գ� Laplace ���̣� 
function demo_fem_4
clc;clear;
nel=10;	% ��Ԫ�� 
nnel=3;	% ÿ����Ԫ�ڵ��� 
ndof=1;	% ÿ���ڵ����ɶ��� 
nnode=12;	% ϵͳ�ܽڵ��� 
sdof=nnode*ndof;	% ϵͳ�����ɶ��� 
% ����ϵͳ�ڵ����� 
% gcoord(i j) i���ڵ��ţ�j��= 1����ʾr���꣬= 2����ʾz���� 
gcoord(1:2:11,1) = 4:0.4:6; gcoord(1:2:11,2) = 0;
gcoord(2:2:12,1) = 4:0.4:6; gcoord(2:2:12,2) = 1;
% ����ÿ����Ԫ�ڵ���;nodes(i j) i����Ԫ���j����Ԫ�ڵ�
nodes(1:2:9,1) = 1:2: 9; nodes(2:2:10,1) = 1:2: 9;
nodes(1:2:9,2) = 4:2:12; nodes(2:2:10,2) = 3:2:11;
nodes(1:2:9,3) = 2:2:10; nodes(2:2:10,3) = 4:2:12;
% ����߽����� 
bcdof(1)=1; bcval(1)=100;	% Լ���ĵ�һ���ڵ��ֵ 
bcdof(2)=2; bcval(2)=100;	% Լ���ĵڶ����ڵ��ֵ 
% ��ʼ�������ʸ�� 
ff=zeros(sdof,1);	        % initialization of system force vector 
kk=zeros(sdof,sdof);	    % initialization of system matrix 
index=zeros(nnel*ndof,1);	% initialization of index vector 
% 
pi=4*atan(1);	% define pi 
ff(11)=120*pi;  % ����ڵ�ͨ��
ff(12)=120*pi; 
% nodal flux at the outside boundary 
for iel=1:nel % loop for the total number of elements 
nd(1)=nodes(iel,1); nd(2)=nodes(iel,2); nd(3)=nodes(iel,3);  
r1=gcoord(nd(1),1);z1=gcoord(nd(1),2);	% coordinate of 1st node 
r2=gcoord(nd(2),1);z2=gcoord(nd(2),2);	% coordinate of 2nd node 
r3=gcoord(nd(3),1);z3=gcoord(nd(3),2);	% coordinate of 3rd node 
index=feeldof(nd,nnel,ndof);	% extract system dofs for the element 
% 
k=felpaxt3(r1,z1,r2,z2,r3,z3);	% ���㵥Ԫ���� 
kk=feasmbl1 (kk,k,index);       % װ��ϵͳ����
end 
[kk,ff]=feaplyc2(kk,ff,bcdof,bcval); % Ӧ�ñ߽����� 
fsol=kk\ff;                          % ����󷽳�
% ��������� 
for i=1:nnode 
r=gcoord(i,1); z=gcoord(i,2); 
esol(i)=100-6*20*log(4)+6*20*log(r); 
end 
% ������������ֵ�� 
num=1:1:sdof; 
store=[num' fsol esol'] 
fsol2=reshape(fsol,2,6);
figure;
set(gca,'FontSize',16);
surf(fsol2);
xlabel('r'); ylabel('z');zlabel('u(r,z)');
%title('ͼ9.3-6������9.3-2����Գ�Laplace������ֵ��');
end

function [k]=felpaxt3(r1 ,z1 ,r2,z2,r3,z3) 
% ��Գ� Laplace ���̵ĵ�Ԫ���� 
% �� - ��Ԫ���Ծ���(3x3) 
A=0.5*(r2*z3+r1*z2+r3*z1-r2*z1-r1*z3-r3*z2); % �����ε�Ԫ��� 
rc=(r1+r2+r3)/3;	% ��Ԫ���� r����ֵ
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
