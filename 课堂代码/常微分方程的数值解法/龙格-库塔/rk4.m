function y=rk4(f,a,b,ya,n)
    h=(b-a)/n; 
    x=a:h:b;
    y(1)=ya;
    for i=1:n
        %һ����λ��ֱ��kǰ�����h��������������k�Ͳ��ó���h������y(i+1)Ҳ������k�ĺ�ǰ�����h
        k1=h*feval(f,x(i),y(i));
        k2=h*feval(f,x(i)+h/2,y(i)+k1/2);
        k3=h*feval(f,x(i)+h/2,y(i)+k2/2);
        k4=h*feval(f,x(i)+h,y(i)+k3);
        y(i+1)=y(i)+(k1+2*k2+2*k3+k4)/6;

    %     k1=feval(f,x(i),y(i));
    %     k2=feval(f,x(i)+h/2,y(i)+h*k1/2);
    %     k3=feval(f,x(i)+h/2,y(i)+h*k2/2);
    %     k4=feval(f,x(i)+h,y(i)+h*k3);
    %     y(i+1)=y(i)+h*(k1+2*k2+2*k3+k4)/6;
    end
    
% function demo_rk4
%     clc;
%     clear all;
%     n=11;
%     a=2;
%     b=3;
%     y(1)=4;
%     h=(b-a)/n;
%     x=a:h:b;
%     y=rk4(@(x,y) x*sqrt(y),a,b,y(1),n);
%     xe=linspace(a,b,100);
%     ye=(1+0.25*xe.*xe).^2;
%     figure(1);
%     set (gca,'FontSize',16);
%     plot (xe,ye,'-',x,y,'o','LineWidth',2);
%     xlabel('x');ylabel('y');
%     legend('��ȷ��','��ֵ��');
%     grid on;
% end
% function f=f02(x,y)
%     f = x*sqrt(y);
%     % a =2;b=3; ya=4;
% end
