%���ָ�ʽ���������
clear all;
clc;
method = menu('Choose a numerical method:',...
       'FTCS','Lax','Lax-Wendroff');
N=100; %�����
L=1.;  %ϵͳ��С
h=L/100; %�����
c=1; %����
tau=0.001;%ʱ�䲽��
coeff=-c*tau/(2.*h);%���з����õ�ϵ��
coefflw=2*coeff^2;%Lax-Wendroff�����õ�ϵ��
nStep=1000;%ѭ������
           %��ʼ���ͱ߽�����
sigma=0.1; %��˹������
k_wave=pi/sigma; %����
x=((1:N)-1/2)*h-L/2;%�������
%��ʼ�Ǹ�˹���ҷֲ�
a=cos(k_wave*x).*exp(-x.^2/(2*sigma^2));
%ʹ�������Ա߽�����
ip(1:(N-1))=2:N;
ip(N)=1;
im(2:N)=1:(N-1);
im(1)=N;
%*��ʼ��ͼ����.
iplot=1;
aplot(:,1)=a(:); %��ʼ̬
tplot(1)=0; %����ʱ��(t=0)
plotStep=nStep/50;
for iStep=1:nStep %%��ѭ��%%
  if(method==1) %FTCS����
    a(1:N)=a(1:N)+coeff*(a(ip)-a(im));  
  elseif(method==2) %Lax����    
    a(1:N)=.5*(a(ip)+a(im))+coeff*(a(ip)-a(im));     
  else    %Lax-Wendroff����
    a(1:N)=a(1:N)+coeff*(a(ip)-a(im))+coefflw*(a(ip)+a(im)-2*a(1:N));
  end
  if(rem(iStep,plotStep)<1) %ȡiStep/plotStep������
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
ylabel('λ��');
xlabel('ʱ��');
zlabel('��ֵ');


