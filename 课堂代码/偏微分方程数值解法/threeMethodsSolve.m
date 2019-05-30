%三种格式解对流方程
clear all;
clc;
method = menu('Choose a numerical method:',...
       'FTCS','Lax','Lax-Wendroff');
N=100; %格点数
L=1.;  %系统大小
h=L/100; %格点间距
c=1; %波速
tau=0.001;%时间步长
coeff=-c*tau/(2.*h);%所有方法用的系数
coefflw=2*coeff^2;%Lax-Wendroff方法用的系数
nStep=1000;%循环步数
           %初始化和边界条件
sigma=0.1; %高斯脉冲宽度
k_wave=pi/sigma; %波数
x=((1:N)-1/2)*h-L/2;%格点坐标
%初始是高斯余弦分布
a=cos(k_wave*x).*exp(-x.^2/(2*sigma^2));
%使用周期性边界条件
ip(1:(N-1))=2:N;
ip(N)=1;
im(2:N)=1:(N-1);
im(1)=N;
%*初始画图变量.
iplot=1;
aplot(:,1)=a(:); %初始态
tplot(1)=0; %初试时间(t=0)
plotStep=nStep/50;
for iStep=1:nStep %%主循环%%
  if(method==1) %FTCS方法
    a(1:N)=a(1:N)+coeff*(a(ip)-a(im));  
  elseif(method==2) %Lax方法    
    a(1:N)=.5*(a(ip)+a(im))+coeff*(a(ip)-a(im));     
  else    %Lax-Wendroff方法
    a(1:N)=a(1:N)+coeff*(a(ip)-a(im))+coefflw*(a(ip)+a(im)-2*a(1:N));
  end
  if(rem(iStep,plotStep)<1) %取iStep/plotStep的余数
    iplot=iplot+1;
    aplot(:,iplot)=a(:);
    tplot(iplot)=tau*iStep;
  end
end
figure(1);
clf;
plot(x,aplot(:,1),'-',x,a,'--');
legend('Initial','Final');
xlabel('x');
ylabel('a(x,t)');
pause(1);
figure(2);
clf;
set(gca,'fontsize',16);
surf(tplot,x,aplot);
shading interp;
ylabel('位置');
xlabel('时间');
zlabel('幅值');


