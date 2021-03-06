clear all;
clc;
%热传导
tau=0.0001;%时间步长
N=50;%将杆分成50段
L=1;%杆长设为1
h=L/(N-1);%步长
kappa=1;%扩散系数=1
coeff=kappa*tau/h^2;
%初始条件和边界条件
%初始温度分布,
tt=zeros(N,1);
% tt(round(N/2))=1/h;
tt(1)=0;
tt(N)=100;
%设置循环与画图变量
xplot=(0:N-1)*h-L/2;%设x画图点坐标
iplot=1;
nstep=3000;%最大迭代步数
plot_step=nstep/50;%图示间的时间步数
%时间步循环
for istep=1:nstep
    %*用显示FTCS计算每个时间步空间各点新的温度作为隐式TCS的原始数据
    temp=tt(2:(N-1))+coeff*(tt(3:N)+tt(1:(N-2))-2*tt(2:(N-1)));%显式计算当做预测,比原来的初始函数少了边界两个数据点
    temp=[tt(1);temp;tt(N)];%拼接一头一尾两个边界数据点
    %先计算下一个时间步边界处的温度
    tt(1)=((tt(2)-tt(1))/h-0)/h*kappa*tau+tt(1);%杆左边界下一个时间步温度
    tt(N)=(0-(tt(N)-tt(N-1))/h)/h*kappa*tau+tt(N);%杆右边界下一个时间步温度
    tt(2:(N-1))=tt(2:(N-1))+coeff*(temp(3:N)+temp(1:(N-2))-2*temp(2:(N-1)));%隐式计算作为最终结果
    %每plot_step时间步记录画图数据
    if(rem(istep,plot_step)<1)
        ttplot(:,iplot)=tt(:); %保存时间步数据，列号是时间步，行号是空间位置
        tplot(iplot)=istep*tau;%保存对应的时间点
        iplot=iplot+1;
    end
end    
%画棒上各点温度随时间演化及等温线随时间演化
figure(1);
clf;%清楚当前图画上的绘图
set(gca,'FontSize',16);
mesh(tplot,xplot,ttplot);
xlabel('t');
ylabel('x');
zlabel('T(x,t)');
title('温度分布');
pause(1);
figure(2);
clf;
set(gca,'Fontsize',16);
cs=contour(tplot,xplot,ttplot,0:0.1:10);%contour：画等高线用的函数
clabel(cs,0:10);
xlabel('t');
ylabel('x');
title('等温线');