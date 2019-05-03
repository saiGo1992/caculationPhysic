% dftcs - Program to solve the diffusion equation 
% using the Forward Time Centered Space (FTCS) scheme.
clear; 
tau = 0.0001; % time step
N = 50; % number of grid points
L = 1.;  % x=-L/2 to x=L/2
h = L/(N-1);  % Grid size
kappa = 1.;   % Diffusion coefficient
coeff = kappa*tau/h^2;
%* Set initial and boundary conditions.
tt = zeros(N,1);          % Initialize temperature to zero at all points
tt(round(N/2)) = 1/h;     % Initial cond. is delta function in center
% The boundary conditions are tt(1) = tt(N) = 0

%* Set up loop and plot variables.
xplot = (0:N-1)*h - L/2;   % Record the x scale for plots
iplot = 1;                 % Counter used to count plots
nstep = 300;               % Maximum number of iterations
plot_step = nstep/50;      % Number of time steps between plots
%* Loop over the desired number of time steps.
for istep=1:nstep  %% MAIN LOOP %%
  %* Compute new temperature using FTCS scheme.
  tt(2:(N-1)) = tt(2:(N-1)) + ...
      coeff*(tt(3:N) + tt(1:(N-2)) - 2*tt(2:(N-1)));
  %* Periodically record temperature for plotting.
  if( rem(istep,plot_step) < 1 )   % Every plot_step steps
    ttplot(:,iplot) = tt(:);       % record tt(i) for plotting
    tplot(iplot) = istep*tau;      % Record time for plots
    iplot = iplot+1;
  end
end
% Plot temperature versus x and t as wire-mesh and contour plots.
figure(1); clf;
set(gca,'FontSize',16);
mesh(tplot,xplot,ttplot);  % Wire-mesh surface plot
xlabel('t');  ylabel('x');  zlabel('T(x,t)');
title('图6.2-2  例题6.2.2温度分布');
pause(1);
figure(2); clf;    
set(gca,'FontSize',16);
cs = contour(tplot,xplot,ttplot,0:0.1:10);  % Contour plot
clabel(cs,0:10);
xlabel('t'); ylabel('x');
title('图6.2-3  例题6.2.2等温线');
