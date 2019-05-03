
%%%%%%%%%%% demo_fftpoi.m %%%%%%%%%%%%%%%
% fftpoi - Program to solve the Poisson equation using 
% MFT method (periodic boundary conditions)
function demo_fftpoi()
clear all; 
%* Initialize parameters (system size, grid spacing, etc.)
eps0 = 8.8542e-12;   % Permittivity (C^2/(N m^2))
N = 50;   % Number of grid points on a side (square grid)
L = 1;    % System size
h = L/N;  % Grid spacing for periodic boundary conditions
x = ((1:N)-1/2)*h;  % Coordinates of grid points
y = x;              % Square grid
[xx yy] = meshgrid(x,y);
  rho = zeros(N,N);  % Initialize charge density to zero
  r1 = [0.25 0.75]
  r2 = [0.75 0.25]
  i1=round(r1(1)/h + 1/2);   % Place charge at r1
  j1=round(r1(2)/h + 1/2);   % grid point
  q1 = 1.;
  rho(i1,j1) = rho(i1,j1) + q1/h^2;
  i2=round(r2(1)/h + 1/2);   % Place charge at r2
  j2=round(r2(2)/h + 1/2);   % grid point
  q2 = -1.;
  rho(i2,j2) = rho(i2,j2) + q2/h^2;
%* Compute matrix P
cx = cos((2*pi/N)*(0:N-1));
cy = cx;
numerator = -h^2/(2*eps0);
tinyNumber = 1e-20;  % Avoids division by zero
for i=1:N
 for j=1:N
   P(i,j) = numerator/(cx(i)+cy(j)-2+tinyNumber);
 end
end

%* Compute potential using MFT method
rhoT = fft2(rho);   % Transform rho into wavenumber domain
phiT = rhoT .* P;   % Computing phi in the wavenumber domain
phi = ifft2(phiT);  % Inv. transf. phi into the coord. domain
phi = real(phi);    % Clean up imaginary part due to round-off

%* Compute electric field as E = - grad phi
[Ex Ey] = gradient(flipud(rot90(phi))); 
magnitude = sqrt(Ex.^2 + Ey.^2);         
Ex = -Ex ./ magnitude;     % Normalize components so
Ey = -Ey ./ magnitude;     % vectors have equal length

%* Plot potential and electric field
subplot(121);
set(gca,'FontSize',16);
surf(x,y,flipud(rot90(phi,1))); shading('interp');colorbar;
xlabel('x'); ylabel('y'); axis([0 L 0 L]);axis('square');
subplot(122);
set(gca,'FontSize',16);
quiver(x,y,Ex,Ey)        % Plot E field with vectors
title('E field (Direction)'); xlabel('x'); ylabel('y');
axis('square');  axis([0 L 0 L]);
   
