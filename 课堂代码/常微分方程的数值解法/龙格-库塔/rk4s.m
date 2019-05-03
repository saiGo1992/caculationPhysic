% rk4s.m是计算整个求解区间的解，可计算高阶微分方程。
function[tout, yout] = rk4s (fun, tspan, y0, n)
t0 = tspan(1);tf = tspan(2);
h=(tf-t0)/n;
t=t0;y=y0(:);
tout =t;
yout=y.';
while (t<tf)
        if t+h>tf,h=tf-t;end
    s1=feval(fun,t,y); %其实就是rk4(4级4阶龙格-库塔)中的k1
    s1=s1(:);%(:)作用是把矩阵的每一列都取出来按顺序拼成一列
    s2=feval(fun,t+h/2,y+h*s1/2); %其实就是rk4(4级4阶龙格-库塔)中的k2
    s2=s2(:);
    s3=feval(fun,t+h/2,y+h*s2/2);  %其实就是rk4(4级4阶龙格-库塔)中的k3
    s3=s3(:);
    s4=feval(fun,t+h,y+h*s3);  %其实就是rk4(4级4阶龙格-库塔)中的k4
    s4=s4(:);
    t=t+h;
    y=y+h*(s1+2*s2+2*s3+s4)/6;%4级4阶龙格库塔公式
    tout=[tout;t];
    yout=[yout;y.'];%.'的作用是矩阵取转置但是不取共轭，如果单纯’则代表矩阵取转置共轭
end

% function demo_rk4s.m
% [x,y] = rk4s(@f21, [0,1],[-0.4;-0.6],40);
% %[x,y] = odd23(@f21, [0,1],[-0.4;-0.6])
% figure (1);
% set (gca, 'FontSize',16);
% plot(x,y(:,1),'r', x,y(:,2),'LineWidth',2);
% xlabel('x');
% ylabel('y');
% legend ('y(1)=y(x)','y(2)=dy/dx');
% grid on;
% 
% function dy=f21(x,y)
% dy=[y(2); 2*y(2)-2*y(1)+exp(2*x)*sin(x)];
% end
