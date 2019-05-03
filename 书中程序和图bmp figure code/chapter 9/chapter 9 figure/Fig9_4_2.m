function demo_fem_6
clear;clc; format long;
% input data for control parameters 
xa=0; ya=0; xb=15;yb=10;um = 10;
lx=29;ly=14;dx = (xb-xa)/lx;
nx=lx+1; ny=ly+1;
nel=lx*ly;	% number of elements 
nnel=4;	% number of nodes per element 
ndof=1;	% number of dofs per node 
nnode=nx*ny;	% total number of nodes in system 
sdof=nnode*ndof;	% total system dofs 
deltt=0.01;	% time step size for transient analysis 
stime=0.0;	% initial time 
ftime=1;	% termination time 
ntime=fix((ftime-stime)/deltt);	% number of time increment 
a=0.04;	% coefficient 
% input data for nodal coordinate values 
% gcoord(i j) where i-> node no. and j-> x or у 
%	 

gcoord= zeros(nx*ny,2); nodes = zeros(lx*ly,4);
[gcoord nodes]=nodes4p2c(gcoord,nodes,xa,xb,ya,yb,lx,ly);

% 给出边界点的编号和取值
ub = zeros(1:nx,1);   % 下边界
ul = zeros(1:ny-1,1); % 左边界
x = xa+dx:dx:xb;
ut =um*abs(sin(pi*x/10)); % 上边界
[bcdof,bcval] = bc_blt(nx,ny,ub,ul,ut);
% initialization of matrices and vectors 
ff=zeros(sdof,1);	% system vector 
fn=zeros(sdof,1);	% effective system vector 
fsol=zeros(sdof,1);	% solution vector 
sol=zeros(1,ntime+1);	% time-history solution 
kk=zeros(sdof,sdof);	% initialization of system matrix 
mm=zeros(sdof,sdof);	% initialization of system matrix 
kn=zeros(sdof,sdof);	% effective system matrix 
index=zeros(nnel*ndof,1);	% initialization of index vector 
% computation of element matrices and vectors and their assembly 
%	 
for iel=1:nel	% loop for the total number of elements 
% 
nd(1)=nodes(iel,1);	% 1st connected node for (iel)-th element 
nd(2)=nodes(iel,2);	% 2nd connected node for (iel)-th element 
nd(3)=nodes(iel,3);	% 3rd connected node for (iel)-th element 
nd(4)=nodes(iel,4);	% 4th connected node for (iel)-th element 
x1=gcoord(nd(1),1); y1=gcoord(nd(1),2); % coord va1ues of 1st node 
x2=gcoord(nd(2),1); y2=gcoord(nd(2),2); % coord values of 2nd node 
x3=gcoord(nd(3),1); y3=gcoord(nd(3),2); % coord values of 3rd node 
x4=gcoord(nd(4),1); y4=gcoord(nd(4),2); % coord values of 4th node 
xleng=x2-x1;	% element size in x-axis 
yleng=y4-y1;	% element size in y-axis 
% 
index=feeldof(nd,nnel,ndof);	% extract system dofs for the element 
k=felp2dr4(xleng,yleng);	    % compute element matrix 
m=a*felpt2r4(xleng,yleng);	    % compute element matrix 
kk=feasmbl1(kk,k,index);	    % assemble element matrices 
mm=feasmbl1(mm,m,index);	    % assemble element matrices 
% 
end 
% loop foi time integration 
%	 
for in=1:sdof 
fsol(in)=10.0;	% initial condition 
end 
% 
sol(1)=fsol(50);	% sol contains time-history solution at node 13 
% 
kn=2*mm+deltt*kk;	% compute effective system matrix 
% 
figure(1);

for it=1:ntime 
    fn=deltt*ff+(2*mm-deltt*kk)*fsol;	    % compute effective vector 
    [kn,fn]=feaplyc2(kn,fn,bcdof,bcval);	% apply boundary condition 
    fsol2=reshape(fsol,nx,ny);
    surf(fsol2);
    set(gca,'FontSize',16);
    xlabel('x'); ylabel('y');zlabel('u(t,x,y)');
    zlim([0 10]);
    pause(0.1);
    fsol=kn\fn;	% solve the matrix equation 
    sol(it+1)=fsol(50);	% sol contains time-history at node 13 
end 
%title('图9.4-4  例题9.4-2的运行结果');
% plot the solution at node 13 

figure(2);
time=0:deltt:ntime*deltt; 
plot(time,sol); 
xlabel('Time') 
ylabel('Solution at the center') 
end

function [k]=felp2dr4(xleng,yleng) 
% Purpose: 
% element matrix for two-dimensional Laplace's equation 
% using four-node bilinear rectangular element 
% к - element stiffness matrix (size of 4x4) 
% xleng - element size in the x-axis 
% yleng - element size in the y-axis 
% element matrix 
% 
k(1,1)=(xleng*xleng+yleng*yleng)/(3*xleng*yleng); 
k(1,2)=(xleng*xleng-2*yleng*yleng)/(6*xleng*yleng); 
k(1,3)=-0.5*k(1,1); 
k(1,4)=(yleng*yleng-2*xleng*xleng)/(6*xleng*yleng); 
k(2,1)=k(1,2); k(2,2)=k(1,1); k(2,3)=k(1,4); k(2,4)=k(1,3); 
k(3,1)=k(1,3); k(3,2)=k(2,3); k(3,3)=k(1,1); k(3,4)=k(1,2); 
k(4,1)=k(1,4); k(4,2)=k(2,4); k(4,3)=k(3,4); k(4,4)=k(1,1); 
end
function [m]=felpt2r4(xleng,yleng) 
% Purpose: 
% element matrix of transient term for two-dimensional Laplace's 
% equation using four-node bilinear rectangular element 
% m - element stiffness matrix (size of 4x4) 
% xleng - element size in the x-axis 
% yleng - element size in the y-axis 
% element matrix 
% 
m=(xleng*yleng/36)*[4 2 1 2;2 4 2 1;1 2 4 2;2 1 2 4]; 
end
