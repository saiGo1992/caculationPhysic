% 例题7.3.8
x=0.1:0.1:5.;y=0.1:0.1:5.;
[xx yy]=meshgrid(x,y);
z=load('walk2.dat');
figure(1);
set(gca,'FontSize',16);
contourf(x,y,z,5);
%title('图7.3-5  例题7.3.8 温度分布图');

grid on;
figure(2)
set(gca,'FontSize',16);
[xi,yi]=meshgrid(0.:0.01:5.,0.:0.01:5.);
zi=interpn(x,y,z,xi,yi);
contourf(yi,xi,zi,10);
% surf(xx,yy,z);
colorbar; 
% mesh(xi,yi,zi);
% shading('interp');
grid on;

