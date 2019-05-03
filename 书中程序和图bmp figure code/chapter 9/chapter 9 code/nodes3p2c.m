% 计算节点坐标和节点编号(3节点单元) 
function [gcoord nodes]=nodes3p2c(gcoord,nodes,xa,xb,ya,yb,lx,ly)
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
for i= 1:lx*ly*2;
    if(rem(i,lx*2)<=(lx+0.01)&&rem(i,lx*2)>0)
        line = ceil(i/(lx*2))-1;
        nodes(i,1)=nx*line+rem(i,lx*2);
        nodes(i,2)=nx*line+rem(i,lx*2)+1;
        nodes(i,3)=nx*line+rem(i,lx*2)+nx+1;
    else
        nodes(i,1)=nx*line+rem((i-lx),lx*2);
        nodes(i,2)=nx*line+rem((i-lx),lx*2)+nx+1;
        nodes(i,3)=nx*line+rem((i-lx),lx*2)+nx;
    end
end
end