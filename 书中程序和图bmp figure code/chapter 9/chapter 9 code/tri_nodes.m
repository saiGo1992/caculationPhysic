function nodes = tri_nodes(nx,ny)
lx = nx-1; ly = ny-1;
nodes = zeros(2*lx*ly,3);
for j = 1:ly
    for i = 1:lx
        k = i*j;
        nodes(i+2*(j-1)*lx,1)  = i+(j-1)*nx;  
        nodes(i+2*(j-1)*lx,2)  = i+(j-1)*nx+1; 
        nodes(i+2*(j-1)*lx,3)  = i+j*nx+1;
        
        nodes(i+(2*j-1)*lx,1)  = i+(j-1)*nx;  
        nodes(i+(2*j-1)*lx,2)  = i+j*nx+1;
        nodes(i+(2*j-1)*lx,3)  = i+j*nx;
    end
end
             

