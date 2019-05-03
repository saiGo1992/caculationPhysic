% ns_2d.m
clc;clear all;
lx=0.1; ly=0.1; nx=33; ny=33; hx=lx/(nx-1); hy=ly/(ny-1);
Re=1.0e4; tp=15.;
u(1:nx,1:ny)=zeros(nx,ny); v(1:nx,1:ny)=zeros(nx,ny); w(1:nx,1:ny)=zeros(nx,ny); 
psi(1:nx,1:ny)=zeros(nx,ny);
x(1:nx)=((1:nx)-1.)*hx; y(1:ny)=((1:ny)-1.)*hy;
[u,v,w,psi,time]=ns_2d_vsf(u,v,w,Re,tp,lx,ly,nx,ny,1,1,1,0,'g1_e81','g2_e81','g3_e81','g4_e81');

figure(1);
contourf(x,y,psi',20,'-k');
xlabel(' x ');
ylabel(' y ');
title('ns-2d');
clear all;