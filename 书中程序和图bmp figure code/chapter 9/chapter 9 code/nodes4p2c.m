% 计算节点坐标和编号（4节点单元）
function [gcoord nodes]=nodes4p2c(gcoord,nodes,xa,xb,ya,yb,lx,ly)
nx=lx+1;
ny=ly+1;
dx=(xb-xa)/lx;
dy=(yb-ya)/ly;
for j = 1:ny
    for i =1:nx
        gcoord((j-1)*nx+i,1)=xa+(i-1)*dx;
        gcoord((j-1)*nx+i,2)=ya+(j-1)*dy;
    end
end
for i= 1:lx*ly;
        line = ceil(i/lx)-1;
        nodes(i,1)=i+line;
        nodes(i,2)=i+line+1;
        nodes(i,3)=i+line+nx+1;
        nodes(i,4)=i+line+nx;
end
end
