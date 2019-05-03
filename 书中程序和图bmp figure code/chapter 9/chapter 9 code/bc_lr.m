%---------------------------------------
% ×óÓÒ-±ß½çÌõ¼þ
%
function [bcdof,bcval] = bc_lr(nx,ny,ul,ur)
bcdof(1:ny)=1:nx:(ny-1)*nx+1; 
bcval(1:ny)=ul;

bcdof(ny+1:2*ny) = nx:nx:nx*ny;
bcval(ny+1:2*ny) = ur;
end

