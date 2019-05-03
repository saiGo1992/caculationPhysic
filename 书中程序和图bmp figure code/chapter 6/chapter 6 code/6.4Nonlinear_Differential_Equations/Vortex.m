%%                 vortex.m
%%    Advection of a temperature field by a fixed vortical velocity.
%%    The equation that is solved is
%%
%%              dT/dt = 0.
%%
%%    Expanded in cartesian coordinates:
%%
%%    $$ 
%%           \frac{\partial T}{\partial t}
%%       + u \frac{\partial T}{\partial x}
%%       + v \frac{\partial T}{\partial y}
%%       = 0
%%    $$
%% 
%%    The initial temperature is a simple tanh-profile
%%    in the y-direction (interpreted as North-South).
%%             $ T  = \tanh y $
%%    The (constant) advecting velocity is a vortex 
%%    with zero radial component and azimuthal speed
%%    varying with distance from the origin as
%%             $V  =  \sech^2 r  tanh r $.
%%
%%    The spatial grid covers a square domain with
%%    x and y varying from XMIN to XMAX and YMIN to
%%    YMAX respectively. There are NUMX * NUMY grid
%%    points.
%%  
%%    (1) Compute the analytical solution.
%%
%%    (2) Finite difference method, the FTUS or 
%%        "Forward-time, upstream-space" method.
%%
%%    (3) Standard leapfrog method.
%%
%%    (4) Leapfrog method with flux-form of equation`.
%%
%%    (5) Solution method: Matsuno scheme. 
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clf

%%%%%%%%%%%%%   Define the spatial grid

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

%%%%%%%%%%%%%   Define the time variable

tmin =   0;     %   Minimum value of t
tmax =   3;     %   Maximum value of t

dt   =  1/12;   %   Time step

numt = (tmax-tmin)/dt;    %   Number of time steps (including t=tmin)
time = linspace(tmin,tmax,numt+1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%  Define the initial temperature field

T = -tanh(YY);   %  Initial T independent of x

%  Plot the initial temperature field
contourf(XX,YY,T)
title('Initial Temperature')
axis('square')
colorbar
pause(1)

T0 = T;   %  Save the initial temperature

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%    Define the (fixed) velocity field

RR = sqrt(XX.*XX+YY.*YY);  % Radial distance r.
VV = (sech(RR).^2).*tanh(RR);  % Azimuthal speed.

contourf(XX,YY,VV)
title('Azimuthal Velocity')
axis('square'); colorbar; pause(1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   Calculate the cartesian velocity components.

THETA = atan2(YY,XX);   %   Azimuthal angle

uu = - VV.*sin(THETA);  %  x component of velocity
vv = + VV.*cos(THETA);  %  y component of velocity

contourf(XX,YY,uu)
title('Zonal Velocity')
axis('square'); colorbar; pause(1)
contourf(XX,YY,vv)
title('Meridional Velocity')
axis('square'); colorbar; pause(1)

quiver(XX,YY,uu,vv)           %   Plot wind arrows.
title('Velocity field')
axis('square'); colorbar; pause(1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
surf(XX,YY,vor)
colorbar; shading('interp'); title('Vorticity')
axis('off'); axis('square'); view(0,90);
drawnow; pause(1)
surf(XX,YY,div)
colorbar; shading('interp'); title('Divergence')
axis('off'); axis('square'); view(0,90);
drawnow; pause(1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%    (1) Compute the analytical solution at
%%        the final time of the integration.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
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
surf(XX,YY,Tanal); view(0,90)
axis('square'); axis('off'); 
shading('interp'); colorbar
heading = ['T(ANAL) at Time = ' num2str(tmax) ];
title(heading); drawnow
pause

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   (2) Solution method: Forward in time,
%%       upstream in space (FTUS).
%%
%%   Note: The T array is overwritten by
%%         new values at each time step.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure  %  New figure window for US solution

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
  surf(XX,YY,T); colorbar; shading('interp')
  axis('off'); axis('square'); view(0,90);
  heading = ['T(US): Time = ' num2str(time(nt+1)) ];
  title(heading); drawnow

  day = nt*dt;
  if(day==1|day==3|day==5|day==10|day==20) pause; end

end       %   End of time loop

%  Plot the temperature error at time tmax
surf(XX,YY,T-Tanal); view(0,90)
axis('square'); axis('off')
shading('interp'); colorbar
heading = ['T(US) error at Time = ' num2str(tmax) ];
title(heading); drawnow
pause

%%  Calculate error statistics for the FTUS scheme.
Tmeanerror = mean(mean(T-Tanal));
Tmeanabserror = mean(mean(abs(T-Tanal)));
Trms = sqrt(mean(mean(T-Tanal).^2));
fprintf('UP: ME, MAE, RMS %6.4g %6.4g %6.4g \n', ...
         Tmeanerror, Tmeanabserror, Trms)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  (3) Solution method: Leapfrog scheme. 
%%
%%  Arrays are defined for clarity, 
%%  not for economy.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

TM = zeros(numx,numy);  %  Temperature at (n-1)*Dt
TZ = zeros(numx,numy);  %  Temperature at n*Dt
TP = zeros(numx,numy);  %  Temperature at (n+1)*Dt

figure  %  New figure window for LF solution

for nt=1:numt     %  Beginning of time loop
    
  if(nt == 1)
    TM = T0;    % For initial values
    TZ = T0;    % For initial values
    TP = T0;    % For boundary values.
    tstep = dt;
  else
    tstep = 2*dt;
  end
    
%%   Loop over each internal grid point
  for nx=2:numx-1
  for ny=2:numy-1
     
%%  Compute the gradients
    dTdx = (TZ(nx+1,ny)-TZ(nx-1,ny))/(2*dx);
    dTdy = (TZ(nx,ny+1)-TZ(nx,ny-1))/(2*dy);

%%  Compute the advection
    advect = uu(nx,ny)*dTdx + vv(nx,ny)*dTdy;

%%  Compute the new value of temperature
    TP(nx,ny) = TM(nx,ny) - tstep*advect;
    
  end
  end

%% End of x-y loop.

%% Plot the temperature field at each time step
  surf(XX,YY,TP); colorbar; shading('interp')
  axis('off'); axis('square'); view(0,90);
  heading = ['T(LF): Time = ' num2str(time(nt+1)) ];
  title(heading); drawnow
  
  day = nt*dt;
  if(day==1|day==3|day==5|day==10|day==20) pause; end

%%  Shuffle the array contents.
  TM = TZ;
  TZ = TP;
  
end       %   End of time loop

%  Plot the temperature error at time tmax
surf(XX,YY,TZ-Tanal); view(0,90)
axis('square'); axis('off');
shading('interp'); colorbar
heading = ['T(LF) error at Time = ' num2str(tmax) ];
title(heading); drawnow
pause

%%  Calculate error statistics for Leapfrog scheme.
Tmeanerror = mean(mean(TZ-Tanal));
Tmeanabserror = mean(mean(abs(TZ-Tanal)));
Trms = sqrt(mean(mean(TZ-Tanal).^2));
fprintf('LF: ME, MAE, RMS %6.4g %6.4g %6.4g \n', ...
         Tmeanerror, Tmeanabserror, Trms)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  (4) Solution method: Leapfrog Flux scheme. 
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  Define arrays (for clarity, not economy)
TM = zeros(numx,numy);  %  Temperature at (n-1)*Dt
TZ = zeros(numx,numy);  %  Temperature at n*Dt
TP = zeros(numx,numy);  %  Temperature at (n+1)*Dt

figure  %  New figure window for LX solution

for nt=1:numt     %  Beginning of time loop
    
  if(nt == 1)
    TM = T0;    % For initial values
    TZ = T0;    % For initial values
    TP = T0;    % For boundary values.
    tstep = dt;
  else
    tstep = 2*dt;
  end
    
%%  Compute the velocity-temperature products.
  uT = uu.*TZ;
  vT = vv.*TZ;

%%   Loop over each internal grid point
  for nx=2:numx-1
  for ny=2:numy-1
     
%%  Compute the gradients
    duTdx = (uT(nx+1,ny)-uT(nx-1,ny))/(2*dx);
    dvTdy = (vT(nx,ny+1)-vT(nx,ny-1))/(2*dy);

%%  Compute the advection
    flux = duTdx + dvTdy;

%%  Compute the new value of temperature
    TP(nx,ny) = TM(nx,ny) - tstep*flux;
    
  end
  end

%% End of x-y loop.

%% Plot the temperature field at each time step
  surf(XX,YY,TP); colorbar; shading('interp')
  axis('off'); axis('square'); view(0,90);
  heading = ['T(LX): Time = ' num2str(time(nt+1)) ];
  title(heading); drawnow
  
  day = nt*dt;
  if(day==1|day==3|day==5|day==10|day==20) pause; end

%%  Shuffle the array contents.
  TM = TZ;
  TZ = TP;
  
end       %   End of time loop

%  Plot the temperature error at time tmax
surf(XX,YY,TZ-Tanal); view(0,90)
axis('square'); axis('off')
shading('interp'); colorbar
heading = ['T(LX) error at Time = ' num2str(tmax) ];
title(heading); drawnow
pause

%%  Calculate error statistics for LP Flux scheme.
Tmeanerror = mean(mean(TZ-Tanal));
Tmeanabserror = mean(mean(abs(TZ-Tanal)));
Trms = sqrt(mean(mean(TZ-Tanal).^2));
fprintf('LX: ME, MAE, RMS %6.4g %6.4g %6.4g \n', ...
         Tmeanerror, Tmeanabserror, Trms)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  (5) Solution method: Matsuno scheme. 
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  Define arrays (for clarity, not economy)
TS = zeros(numx,numy);  %  Temperature (prelim) 
TP = zeros(numx,numy);  %  Temperature at (n+1)*Dt

figure  %  New figure window for MS scheme

T  = T0;    % Initial values
TP = T0;    % Boundary values

for nt=1:numt     %  Beginning of time loop
    
%%   Loop over each internal grid point
  for nx=2:numx-1
  for ny=2:numy-1
     
%%  Compute the gradients
    dTdx = (T(nx+1,ny)-T(nx-1,ny))/(2*dx);
    dTdy = (T(nx,ny+1)-T(nx,ny-1))/(2*dy);

%%  Compute the advection
    advect = uu(nx,ny)*dTdx + vv(nx,ny)*dTdy;

%%  Compute the preliminary value of temperature
    TS(nx,ny) = T(nx,ny) - dt*advect;
    
  end
  end

  for nx=2:numx-1
  for ny=2:numy-1

%%  Compute the gradients
    dTdx = (TS(nx+1,ny)-TS(nx-1,ny))/(2*dx);
    dTdy = (TS(nx,ny+1)-TS(nx,ny-1))/(2*dy);

%%  Compute the advection
    advect = uu(nx,ny)*dTdx + vv(nx,ny)*dTdy;

%%  Compute the preliminary value of temperature
    TP(nx,ny) = T(nx,ny) - dt*advect;
    
  end
  end

%% End of x-y loop.

%% Plot the temperature field at each time step
  surf(XX,YY,TP); colorbar; shading('interp')
  axis('off'); axis('square'); view(0,90);
  heading = ['T(MS): Time = ' num2str(time(nt+1)) ];
  title(heading); drawnow
  
  day = nt*dt;
  if(day==1|day==3|day==5|day==10|day==20) pause; end

%%  Shuffle the array contents.
  T = TP;
  
end       %   End of time loop

%  Plot the temperature error at time tmax
surf(XX,YY,T-Tanal); view(0,90)
axis('square'); axis('off')
shading('interp'); colorbar
heading = ['T(MS) error at Time = ' num2str(tmax) ];
title(heading); drawnow
pause

%%  Calculate error statistics for LP Flux scheme.
Tmeanerror = mean(mean(T-Tanal));
Tmeanabserror = mean(mean(abs(T-Tanal)));
Trms = sqrt(mean(mean(T-Tanal).^2));
fprintf('MS: ME, MAE, RMS %6.4g %6.4g %6.4g \n', ...
         Tmeanerror, Tmeanabserror, Trms)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
