% Euler�����ļ������euler_pc.m
function[x,p,y]=euler_pc(f,x0,y,xn,n)
h=(xn-x0)/n;
x=x0:h:xn;
y(1)=y0;
for i=1:n
    p(i+1)=y(i)+h*f(x(i),y(i));%��ʾ��ʽ����ΪԤ��ֵ
    y(i+1)=y(i)+h/2*(f(x(i),y(i))+f(x(i+1),p(i+1)));%У����ʽ
end

%���⣺
%����ָ��˥�������΢�ַ���dy/dt = -lamda*y��lamdaȡ-1Ϊ˥��������ȡt=0��y(0)=1,lamda=1,��t������[0,8]
%��˥����������
% function decay
% dt =0.1;
% lambda = 1.0;
% n=80;
% t(1) = 0; y(1) = 1.0;
% p(1)=1.0;%p��ΪУ��������Ա�
% for i =1:n
%     %������㷨
%     t(i+1) = (i+1)*dt;
%     f(i) = -lambda*y(i);
%     y(i+1) = y(i)+dt*f(i);%Ԥ��ֵ
%     p(i+1) = y(i)+dt/2*(f(i)+(-lambda*y(i+1)));%У����ʽ
% end 
% figure(1);
% set (gca, 'FontSize', 16);
% plot (t, y, 'b.',t,y(1)*exp(-lambda.*t),'r-');
% hold on;
% plot (t, p, 'c.');
% legend ('��ֵ��','��ȷ��'); 
% xlabel ('t');ylabel('y(t)');
% grid on;
