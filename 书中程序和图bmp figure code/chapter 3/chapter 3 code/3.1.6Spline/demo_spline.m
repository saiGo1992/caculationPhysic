% demo_spline.m
x = -1:0.1:1;  
y = 1./(1+x.*x);
xx = -1:.01:1;
yy = spline(x,y,xx);
plot(x,y,'bo',xx,yy,'r','LineWidth',2)
title('y=1/(1+x^2): ÑùÌõ²åÖµ','FontSize',12);
xlabel('x','FontSize',12);
ylabel('y','FontSize',12)
