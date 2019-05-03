% rectangle.m
%�����������ʵ���ǰѱ����ֵ�����ֳ����ɵȼ������������ھ���ĸ�һ��ȡ������߽��ֵ��һ��ȡ�����ұ߽��ֵ��һ��ȡ�����е��ֵ
clc; clear all; format long;
n=8;
for k=1:n;
      dx=pi/k;
      x=0:dx:pi;
      xm=dx/2:dx:pi-dx/2;
      f=sin(x);
      fm=sin(xm);
      I1(k)=sum(f(1:k))*dx;
      Ir(k)= sum(f(2:k+1))*dx;
      Im(k)=sum(fm)*dx;
end
figure(1);
set(gca,'FontSize',16);
plot(1:n,I1,'r-',1:n,Ir,'bo',1:n,Im,'k--','linewidth',2);
xlabel('������'); ylabel('����ֵ');
legend('�����','�Ҿ���','�е㹫ʽ');
title('���������ʽ����Ƚ�');
grid on;
