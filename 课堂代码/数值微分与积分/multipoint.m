% multipoint����
%ʹ���������ղ�ֵ���õ��Ĳ�ֵʽ�ӣ�Ȼ���������ԭ����ʽ������(������x=x0+th���t�󵼣�ǰ�����t=1,2,������t=-1,-2)
function df = multipoint (func, x0, h,type)
y0 = subs(sym(func), symvar(sym(func)),x0);       
y1 = subs(sym(func), symvar(sym(func)),x0+h);       
y2 = subs(sym(func), symvar(sym(func)),x0+2*h);   
y_1 = subs(sym(func), symvar(sym(func)),x0-h);    
y_2 = subs(sym(func), symvar(sym(func)),x0-2*h);  
switch type
    case 1
        df =(y1-y0)/h; %ǰ��
    case 2
        df = (y0-y_1)/h; %��� 
    case 3
        df = (y1-y_1)/(2*h); %���Ĳ�
    case 4
        df = (-3*y0+4*y1-y2)/(2*h); %3��ǰ��
    case 5
        df = (3*y0-4*y_1+y_2)/(2*h); %3����
end
% df =(y1-y0)/h %ǰ��
% df = (y0-y_1)/h %��� 
% df = (y1-y_1)/(2*h) %���Ĳ�
% df = (-3*y0+4*y1-y2)/(2*h) %3��ǰ��
% df = (3*y0-4*y_1+y_2)/(2*h) %3����

%��֤����
% clear all; format long;
% x = 0:pi/16:pi;
% y=sin(x);
% yp=cos(x);
% df1 = multipoint ('sin(x)',x,pi/64,1);
% df3 = multipoint ('sin(x)',x,pi/64,3);
% figure(1);
% set (gca, 'FontSize',16);
% plot(x,df1,'r-',x,df3,'k.-',x,y,'b--',x,yp,'o');
% grid on;
% title('y=sin(x)�ĵ�����');
% xlabel('x');
% ylabel('y');
% legend('ǰ��','���Ĳ�','ԭ����','��������');
