clc;clear;
x0 = 0; xn = 1;
for n = 2:1:6
    x = linspace(x0,xn,n);
    u = linspace(x0,xn,200);
    figure(n);
    for k = 1:n
        hold on;
        v = basefunction(x,k,u);
        subplot(1,n,k);
        set(gca,'FontSize',16);
        plot(u,v,'k',u,0,'LineWidth',2);
        xlabel('x','FontSize',16);
        ylabel('»ùº¯Êý','FontSize',16);
        legend(num2str(k));
    end
end




