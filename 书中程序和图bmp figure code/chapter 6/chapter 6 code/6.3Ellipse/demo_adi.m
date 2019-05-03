% demo_adi.m
clc; clear all; 
Tu=100;Tl=66;Tr=32;Td=0;
dx=10.;dy=10.;dt=10;
ka=0.835;kmax=50;n = 20;
lamda=ka*dt/(dx*dx);
T = zeros(n,n);
T(1,1)=0.5*(Td+Tl); T(1,n)=0.5*(Tl+Tu);
T(n,n)=0.5*(Tu+Tr); T(n,1)=0.5*(Tr+Td);
T(1,2:n-1)=Tl;  T(n,2:n-1)=Tr;
T(2:n-1,1)=Td;  T(2:n-1,n)=Tu;
T = T'
% surfc(T);pause;
aj(1:n)=-lamda;     ai(1:n)=lamda;
bj(1:n)=2*(1.+lamda); bi(1:n)=2.*(1-lamda);
cj(1:n)=-lamda;	  ci(1:n)=lamda;
for k = 1:kmax
    for i=2:n-1
        for j=2:n-1
            rr(j)=ai(i)*T(i-1,j)+bi(i)*T(i,j)+ci(i)*T(i+1,j);
            r(j-1) =rr(j);
        end 
        rr(2)=rr(2)-aj(2)*T(i,1);
        r(1) =rr(2);
        rr(n-1)=rr(n-1)-cj(n-1)*T(i,n);
        r(n-2)=rr(n-1);
        u = tri0(aj,bj,cj,r);
        T(i,2:n-1)=u(1:n-2);
    end 
    TT = T';
    for i=2:n-1
        for j=2:n-1
            rr(j)=ai(i)*TT(i-1,j)+bi(i)*TT(i,j)+ci(i)*TT(i+1,j);
            r(j-1) =rr(j);
        end 
        rr(2)=rr(2)-aj(2)*TT(i,1);r(1)=rr(2);
	    rr(n-1)=rr(n-1)-cj(n-1)*TT(i,n);r(n-2)=rr(n-1);
	    u = tri0(aj,bj,cj,r);
	   TT(i,2:n-1) = u(1:n-2);
    end
    hold off;
    surf(TT');shading interp;
    set(gca,'fontsize',16);
    title('图6.3-5  例题6.3.3温度分布');
    zlabel('温度');
    xlabel('x'); ylabel('y');
    pause(0.1);
end

  
  