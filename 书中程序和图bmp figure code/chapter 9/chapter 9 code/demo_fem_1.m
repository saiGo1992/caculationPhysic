%example demo_fem_1.m
function demo_fem_1
clc;clear all; format long;
nel   = 15;       % ��Ԫ��
nnel  = 2;        % ÿ����Ԫ�Ľڵ���
ndof  = 1;        % ÿ���ڵ�����ɶ���
nnode = nel+1;    % ϵͳ�ܵĽڵ���
sdof=nnode*ndof;  % ��ϵͳ���ɶ���
% ����ڵ�����ֵ
xa = 0.0; xb = 1.0; dx = (xb-xa)/nel;
gcoord(1:nnode) = xa:dx:xb;
% ����ڵ�ı��
nodes(1:nel,1)=1:nel; nodes(1:nel,2)=2:nel+1;
% ����΢�ַ��̵�ϵ��a,b,c
acoef=1; bcoef=-3; ccoef=2;
% ����߽�����
bcdof(1)=1; bcval(1)=0;     % ��ʾ��1���߽�ڵ�����1����Ӧ��ֵ��0
bcdof(2)=nnode; bcval(2)=0; % ��ʾ��2���߽�ڵ�����nnode����Ӧ��ֵ��0
% ��ʼ����Ԫ�ľ����ʸ��
ff = zeros(sdof,1);         % ff��ϵͳ��ʸ��
kk = zeros(sdof,sdof);      % kk��ϵͳ�ľ���
index = zeros(nnel*ndof,1); % 
% ���㵥Ԫ�����ʸ����װ��
for iel=1:nel; % �����е�Ԫѭ��
    nl=nodes(iel,1);nr=nodes(iel,2); % �����iel��Ԫ�������ڵ�
    xl=gcoord(nl);xr=gcoord(nr);     % �����iel��Ԫ�������ڵ������ 
    eleng=xr-xl;  % ��iel��Ԫ�ĳ���
    index=feeldof1(iel,nnel,ndof);
    k=feode2l(acoef,bcoef,ccoef,eleng); % �����iel��Ԫ�ľ���
    f=fef1l(xl,xr);                     % �����iel��Ԫ��ʸ��
    [kk,ff]=feasmbl2(kk,ff,k,f,index);  % װ�䵥Ԫ�����ʸ��
end
% Ӧ�ñ߽�����
[kk,ff]=feaplyc2(kk,ff,bcdof,bcval);
% ����󷽳�
fsol=kk\ff;
% ������
c1=0.5/exp(1); c2=-0.5*(1+1/exp(1));
for i=1:nnode
    x=gcoord(i); esol(i)=c1*exp(2*x)+c2*exp(x)+1/2;
end
% �����ȷ�������Ԫ��
num=1:1:sdof;
results = [num' fsol esol'];
plot(num,fsol,'rs',num,esol,'k-');
legend('������','��ֵ��');
title('ͼ9.2-1  d^2u/dx^2-3du/dx+2u=1,u(0)=0,u(1)=0����Ԫ����');
end

% Ӧ��Լ�������󷽳�[kk]x=ff
function [kk,ff]=feaplyc2(kk,ff,bcdof,bcval)
n=length(bcdof); sdof=size(kk);
for i=1:n
    c=bcdof(i);
    for j=1:sdof
        kk(c,j)=0;
    end
    kk(c,c)=1; ff(c)=bcval(i);
end
end
%��Ԫ�����ʸ��װ���ϵͳ�����ʸ��
function [kk,ff]=feasmbl2(kk,ff,k,f,index)
edof=length(index);
for i=1:edof
    ii=index(i); ff(ii)=ff(ii)+f(i);
    for j=1:edof
        jj=index(j); kk(ii,jj)=kk(ii,jj)+k(i,j);
    end
end
end
% ������ÿ����Ԫ����ϵ��ϵͳ���ɶ�
function [index] = feeldof1(iel,nnel,ndof)
edof=nnel*ndof;
start = (iel-1)*(nnel-1)*ndof;
for i=1:edof
    index(i)=start+i;
end
end
% ��Ӧ��f(x)=1�ĵ�Ԫʸ��
function [f]=fef1l(xl,xr)
eleng = xr - xl;
f=[eleng/2; eleng/2];
end
% ��Ԫ����
function [k]=feode2l(acoef,bcoef,ccoef,eleng)
a1=-(acoef/eleng);a2=bcoef/2;a3=ccoef*eleng/6;
k=[a1-a2+2*a3 -a1+a2+a3; -a1-a2+a3 a1+a2+2*a3];
end
