%%%%%%%%%% MHD.M %%%%%%%%%%%%
L=3e-5;u=1e-3; esp=0.005;  A=-6;x=1;Rmax=60;Rmin=0;Zmax=60;Zmin=0; G=0.45;I=100;K=100; %初值   
h=(Rmax-Rmin)/I;
l=(Zmax-Zmin)/K;
p=5-6*(L*Rmax^2+u);
for i=1:I+1;
   R(i)=Rmin+(i-1)*h;
   f(i)=L*R(i)^2+u;
end
for k=1:K+1;
    Z(k)=Zmin+(k-1)*l;
 end
for i=1:I+1
   for k=1:K+1
I0(i,k)=1-(R(i)-R(1))^2/((Rmax-Rmin)/2-h)^2-Z(k)^2/((Zmax-Zmin)/2-l)^2;  %初始位形
   end
end
while x>esp   
   for n=1:2,
mx1=zeros(I+1,I+1);   %mx1为第一个三对角阵
mx1(1,1)=1;
mx1(1,2)=0; 
mx1(I+1,I)=0;
mx1(I+1,I+1)=1;
d(1)=A;  d(I+1)=A;
for k=2:K,
  for i=2:I,
     if I0(i,k)<0
         s=0;
      else s=1;
         end
mx1(i,i)=(R(i)/(h^2*(R(i)+h/2))+R(i)/(h^2*(R(i)-h/2))-f(i)*s+p);
mx1(i,i-1)=-R(i)/(h^2*(R(i)-h/2));
mx1(i,i+1)=-R(i)/(h^2*(R(i)+h/2));
d(i)=1/l^2*I0(i,k+1)+(p-2/l^2)*I0(i,k)+1/l^2*I0(i,k-1);
end
W10=mx1\d';             %解三对角阵
for m=1:I+1,
W1(m,k)=W10(m);W1(m,1)=A;W1(m,101)=A;
end
end
mx2=zeros(K+1,K+1);            %mx2为第二个三对角阵
mx2(1,1)=1;  mx2(K+1,K+1)=1;
mx2(1,2)=-1;  mx2(K+1,K)=0;
D(1)=0;  D(K+1)=A;

for i=2:I,
for k=2:K,
    if W1(i,k)<0
         s=0;
      else s=1;
         end
mx2(k,k-1)=-1/l^2;mx2(k,k+1)=-1/l^2;
mx2(k,k)=2/l^2-f(i)*s+p;
D(k)=R(i)/(h^2*(R(i)+h/2))*W1(i+1,k)+(p-R(i)/(h^2*(R(i)+h/2))-R(i)/(h^2*(R(i)-h/2)))*W1(i,k)+R(i)/(h^2*(R(i)-h/2))*W1(i-1,k);

end
W21=mx2\D';          %解三对角阵  
for t=1:1:K+1,
W2(i,t)=W21(t)';W2(1,t)=A;W2(101,t)=A;
end
end
if n==1,
Wm1=W2;
elseif n==2,
Wm2=W2;
end
end
W01=(1-G)*I0+2*G*Wm1-G*Wm2;   %三段迭代
z=0;
for k=1:K+1,                      
   for i=1:I+1,
      X(i,k)=abs(W01(i,k)-I0(i,k));
   z=z+X(i,k);  
  end
end
I0=W01;
x=z/10000;
end
figure(1)
 mesh(W01);
figure(2)
contour(W01,40);
colorbar;
xlabel('Z');
ylabel('R');

