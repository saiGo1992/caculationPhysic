%---------------------------------------
% 下左上-边界条件
%
function [bcdof,bcval] = bc_blt(nx,ny,ub,ul,ut)
bcdof(1:nx)=1:nx; 
bcval(1:nx)=ub;

bcdof(nx+1:nx+ny-1) = nx+1:nx:nx*(ny-1)+1;
bcval(nx+1:nx+ny-1) = ul;

bcdof(nx+ny:2*nx+ny-2) = nx*(ny-1)+2:nx*ny; 
bcval(nx+ny:2*nx+ny-2) = ut;
end

