%demo_fem_2.m
function demo_fem_2
clc;clear;
nel=15;
nnel=2;
ndof=1;
nnode=nel+1;
sdof=nnode*ndof;
gcoord(1:nnode) = 0.0:1.0/nel:1.0;
nodes(1:nel,1)=1:nel; nodes(1:nel,2)=2:nel+1;

acoef=1; bcoef=-3; ccoef=2;  % 微分方程系数
bcdof(1)=1;bcval(1)=0;       % 边界

ff=zeros(sdof,1);
kk=zeros(sdof,sdof);
index=zeros(nnel*ndof,1);
for iel=1:nel;
    nl=nodes(iel,1);nr=nodes(iel,2);
    xl=gcoord(nl);xr=gcoord(nr);
    eleng=xr-xl;
    index=feeldof1(iel,nnel,ndof);
    k=feode2l(acoef,bcoef,ccoef,eleng);
    f=fef1l(xl,xr);
    [kk,ff]=feasmbl2(kk,ff,k,f,index);
end


ff(nnode)=ff(nnode)-1;



[kk,ff]=feaplyc2(kk,ff,bcdof,bcval);
fsol=kk\ff;
c1=(1+0.5*exp(1))/(2*exp(2)-exp(1));
c2=-(1+exp(2))/(2*exp(2)-exp(1));
for i=1:nnode
    x=gcoord(i);
    esol(i)=c1*exp(2*x)+c2*exp(x)+1/2;
end
num=1:1:sdof;
results=[num' fsol esol'];
plot(num,fsol,'rs',num,esol,'k-');
end



function [kk,ff]=feaplyc2(kk,ff,bcdof,bcval)
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

function [kk,ff]=feasmbl2(kk,ff,k,f,index)
edof=length(index);
for i=1:edof
    ii=index(i);
    ff(ii)=ff(ii)+f(i);
    for j=1:edof
        jj=index(j);
        kk(ii,jj)=kk(ii,jj)+k(i,j);
    end
end
end



function [index] = feeldof1(iel,nnel,ndof)
edof=nnel*ndof;
start = (iel-1)*(nnel-1)*ndof;
for i=1:edof
    index(i)=start+i;
end
end



function [f]=fef1l(xl,xr)
eleng = xr - xl;
f=[eleng/2; eleng/2];
end



function [k]=feode2l(acoef,bcoef,ccoef,eleng)
a1=-(acoef/eleng);a2=bcoef/2;a3=ccoef*eleng/6;
k=[a1-a2+2*a3 -a1+a2+a3; -a1-a2+a3 a1+a2+2*a3];
end
