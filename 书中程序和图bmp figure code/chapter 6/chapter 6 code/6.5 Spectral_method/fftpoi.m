%%%%%%%% fftoi.m %%%%%%%%%%%%%%
% ***** To plot in MATLAB; use the script below ********************
load x.txt; load y.txt; load phi.txt;
%* Compute electric field as E = - grad phi
[Ex Ey] = gradient(flipud(rot90(phi)));
magnitude = sqrt(Ex.^2 + Ey.^2);
Ex = -Ex ./ magnitude;     % Normalize components so
Ey = -Ey ./ magnitude;     % vectors have equal length
%* Plot potential and electric field
figure(1); clf;
contour3(x,y,flipud(rot90(phi,1)),60);
xlabel('x'); ylabel('y'); zlabel('\Phi(x,y)');
figure(2); clf;
contour(x,y,flipud(rot90(phi,1)),60);
title('\phi(x,y) potential contour');
xlabel('x'); ylabel('y');
figure(3); clf;
quiver(x,y,Ex,Ey)        % Plot E field with vectors
title('E field (Direction)'); xlabel('x'); ylabel('y');
axis('square');  axis([0 1 0 1]);
% *****************************************************************