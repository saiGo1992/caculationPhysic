function gcoord = triangle_gcoord(xmin,xmax,ymin,ymax,nx,ny)
dx = (xmax-xmin)/(nx-1); 
dy = (ymax-ymin)/(ny-1);
gcoord = zeros(nx*ny,2);
for j = 1:ny
    for i =1:nx
        gcoord((j-1)*nx+i,1)=xmin+(i-1)*dx; % 节点j-1)*nx+i的x坐标
        gcoord((j-1)*nx+i,2)=ymin+(j-1)*dy; % 节点j-1)*nx+i的y坐标
    end
end
