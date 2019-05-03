% SOR
clc; clf; clear;
xmin = 0; xmax = 2; ymin = 0; ymax = 2.0;
tx(xmin,xmax,ymin,ymax);
for i = 1:1:3
    point_line(i*0.5,i*0.5,ymin,ymax);
end
for i = 1:1:3
    point_line(xmin,xmax,i*0.5,i*0.5);
end
pointk(0.5,1,40);
pointk(1.5,1,40);
pointr(1,1,40);
pointk(1,1.5,40);
pointk(1,0.5,40);
text(0.35,0.8,'i-1,j','FontSize',16);
text(1.35,0.8,'i+1,j','FontSize',16);
text(0.9,1.3,'i,j+1','FontSize',16);
text(0.9,0.3,'i,j-1','FontSize',16);
text(0.9,0.8,'i,j','FontSize',16);
%text(0.2,-0.15,'ͼ6.3-1  Laplace EQ','FontSize',16);
