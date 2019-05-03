clear all; clf 
%%   Define the spatial grid
xmin = -3;     %   Minimum value of x
xmax = +3;     %   Maximum value of x
ymin = -3;     %   Minimum value of y
ymax = +3;     %   Maximum value of y
numx = 101;     %   Number of points in x direction
numy = 101;     %   Number of points in y direction
dx = (xmax-xmin)/(numx-1);   %  Step in x direction
dy = (ymax-ymin)/(numy-1);   %  Step in y direction
x = linspace(xmin,xmax,numx);   %  Vector of x values
y = linspace(ymin,ymax,numy);   %  Vector of y values
[XX,YY] = meshgrid(x,y);  %  2D arrays of x and y on grid.
XX = XX'; YY = YY';       %  Perversity of matlab

%%  Define the time variable
tmin =   0;     %   Minimum value of t
tmax =   6;     %   Maximum value of t
dt   =  1/12;   %   Time step
numt = (tmax-tmin)/dt;    %   Number of time steps (including t=tmin)
time = linspace(tmin,tmax,numt+1);
%%  Define the initial temperature field
T = -tanh(YY);   %  Initial T independent of x
%  Plot the initial temperature field
subplot(231);contourf(XX,YY,T); 
title('Initial Temperature')
axis('square')
colorbar
pause
T0 = T;   %  Save the initial temperature
%%    Define the (fixed) velocity field
RR = sqrt(XX.*XX+YY.*YY);  % Radial distance r.
VV = (sech(RR).^2).*tanh(RR);  % Azimuthal speed.
%%   Calculate the cartesian velocity components.
THETA = atan2(YY,XX);   %   Azimuthal angle
uu = - VV.*sin(THETA);  %  x component of velocity
vv = + VV.*cos(THETA);  %  y component of velocity
subplot(232);quiver(XX,YY,uu,vv);           %   Plot wind arrows.
title('Velocity field')
axis('square'); colorbar; pause
%%   Compute the vorticity and divergence.
  vor = zeros(numx,numy);
  div = zeros(numx,numy);
  for nx=2:numx-1
  for ny=2:numy-1
    dudx = (uu(nx+1,ny)-uu(nx-1,ny))/(2*dx);
    dudy = (uu(nx,ny+1)-uu(nx,ny-1))/(2*dy);
    dvdx = (vv(nx+1,ny)-vv(nx-1,ny))/(2*dx);
    dvdy = (vv(nx,ny+1)-vv(nx,ny-1))/(2*dy);
    vor(nx,ny) = dvdx - dudy;
    div(nx,ny) = dudx + dvdy;
  end
  end
%% Plot the vorticity and divergence
subplot(233);surf(XX,YY,vor)
colorbar; shading('interp'); title('Vorticity')
axis('off'); axis('square'); view(0,90);
drawnow; pause(1)
subplot(234);surf(XX,YY,div)
colorbar; shading('interp'); title('Divergence')
axis('off'); axis('square'); view(0,90);
drawnow; pause
%%    (1) Compute the analytical solution at
%%        the final time of the integration.
%  Compute the departure point for each (x,y)
for ny=1:numy
for nx=1:numx
  xx = x(nx);
  yy = y(ny);
  rr = sqrt(xx^2+yy^2);
  theta = atan2(yy,xx);
  omega = ((sech(rr))^2*tanh(rr))/(rr+eps);
  omt = omega*tmax;
  r0 = rr;
  theta0 = theta - omt;
  x0 = r0*cos(theta0);
  y0 = r0*sin(theta0);
  Tanal(nx,ny) = -tanh(y0*cos(omt)-x0*sin(omt));
end
end
%  Plot the analytical temperature solution
subplot(235);
surf(XX,YY,Tanal); view(0,90)
axis('square'); axis('off'); 
shading('interp'); colorbar
heading = ['T(ANAL) at Time = ' num2str(tmax) ];
title(heading); drawnow
pause
%% (2) Solution method: Forward in time,
%%       upstream in space (FTUS).
%  New figure window for US solution
for nt=1:numt     %  Beginning of time loop

%%   Loop over each internal grid point
  for nx=2:numx-1
  for ny=2:numy-1
     
%%  Compute the upstream gradients
    if(uu(nx,ny)>=0)
      dTdx = ( T(nx,ny)-T(nx-1,ny) ) / dx;
    else
      dTdx = ( T(nx+1,ny)-T(nx,ny) ) / dx;
    end
    if(vv(nx,ny)>=0)
      dTdy = ( T(nx,ny)-T(nx,ny-1) ) / dy;
    else
      dTdy = ( T(nx,ny+1)-T(nx,ny) ) / dy;
    end

%%  Compute the advection
    advect = uu(nx,ny)*dTdx + vv(nx,ny)*dTdy;

%%  Compute the new value of temperature
    T(nx,ny) = T(nx,ny) - dt*advect;
    
  end
  end

%% End of x-y loop.

%% Plot the temperature field at each time step
  subplot(236);surf(XX,YY,T); colorbar; shading('interp')
  axis('off'); axis('square'); view(0,90);
  heading = ['T(US): Time = ' num2str(time(nt+1)) ];
  title(heading); drawnow
  day = nt*dt;
  if(day==1|day==3|day==5|day==10|day==20) pause; end

end       %   End of time loop

