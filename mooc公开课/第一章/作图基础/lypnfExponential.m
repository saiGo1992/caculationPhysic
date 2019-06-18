%¿Ó—≈∆’≈µ∑Ú÷∏ ˝%
x=0.5;u=3:0.0001:4;
y=0;N=300;
for j=1:N
  x=u.*(x-x.^2);  
  df=log(abs(u-2*u.*x));
  y=y+df;
end
plot(u,y/N);