function [kk,ff]=feaplyc2(kk,ff,bcdof,bcval) 
%	*	 
% Purpose: 
% Apply constraints to matrix equation [kk]x=ff 
% 
% Synopsis: 
% [kk,ff]=feaplybc(kk,ff,bcdof,bcval) 
% 
% Variable Description: 
% kk - system matrix before applying constraints 
% ff - system vector before applying constraints 
% bcdof - a vector containing constrained d.o.f 
% bcval - a vector containing constrained value 
% 
% For example, there are constraints at d.o.f=2 and 10 
% and their constrained values are 0.0 and 2.5, 
% respectively. Then, bcdof(l)=2 and bcdofB)=10; and 
% bcval(l)=1.0 and bcvalB)=2.5. 
%	,,->.-, ,	_	.	 
n=length(bcdof); 
sdof=size(kk); 
for i=1:n 
c=bcdof(i); 
for j=1:sdof 
kk(c,j)=0; 
end 
kk(c,c)=1; 
ff(c)=bcval(i); 
end 
end
