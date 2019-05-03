% Laplace_SOR.m	
clc;clear all;
imax=25;jmax=25;lamda=1.5;
Tu=100;Tl=75.;Tr=50.;Td=0.;dx=1.0;dy=1.0;kmax=9;
T = zeros(imax,jmax);
T(1,1)=0.5*(Td+Tl);T(1,jmax)=0.5*(Tl+Tu);
T(imax,jmax)=0.5*(Tu+Tr);T(imax,1)=0.5*(Tr+Td);
T(1,:)=Tl; T(imax,:)=Tr;T(:,1)=Td;T(:,jmax)=Tu;
for k=1:kmax
  a(:,:)=T(:,:);
  for i=2:imax-1
    for j=2:jmax-1
         T(i,j)=0.25*(T(i+1,j)+T(i-1,j)+T(i,j+1)+T(i,j-1));
    end 
  end
  T(:,:)=lamda*T(:,:)+(1.-lamda)*a(:,:);
end
ep = abs((T(2,2)-a(2,2))/T(2,2));
TT=T';[qx,qy] = gradient(TT);
x0 = (0:imax-1)*dx;y0=(0:jmax-1)*dy;
[x y] =meshgrid(x0,y0);
figure(1);surfc(x,y,TT);
set(gca,'fontsize',16);
%title('图6.3-3a  例题6.3.2温度分布');
xlabel('x');ylabel('y');
zlabel('温度');
figure(2);quiver(x,y,-0.49*qx,-0.49*qy,1.5);
hold on;contour(TT,40);
set(gca,'fontsize',16);
%title('图6.3-3b  例题6.3.2热流分布');
xlabel('x');ylabel('y');
axis([0 25 0 25]);
text(12,1,'0^o');
text(12,24,'100^o');
text(1,14,'75^o');
text(23,14,'50^o');

