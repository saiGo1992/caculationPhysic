% multipoint程序
%使用拉格朗日插值法得到的插值式子，然后用其代替原来的式子来求导(其中设x=x0+th后对t求导，前差就是t=1,2,后差就是t=-1,-2)
function df = multipoint (func, x0, h,type)
y0 = subs(sym(func), symvar(sym(func)),x0);       
y1 = subs(sym(func), symvar(sym(func)),x0+h);       
y2 = subs(sym(func), symvar(sym(func)),x0+2*h);   
y_1 = subs(sym(func), symvar(sym(func)),x0-h);    
y_2 = subs(sym(func), symvar(sym(func)),x0-2*h);  
switch type
    case 1
        df =(y1-y0)/h; %前差
    case 2
        df = (y0-y_1)/h; %后差 
    case 3
        df = (y1-y_1)/(2*h); %中心差
    case 4
        df = (-3*y0+4*y1-y2)/(2*h); %3点前差
    case 5
        df = (3*y0-4*y_1+y_2)/(2*h); %3点后差
end
% df =(y1-y0)/h %前差
% df = (y0-y_1)/h %后差 
% df = (y1-y_1)/(2*h) %中心差
% df = (-3*y0+4*y1-y2)/(2*h) %3点前差
% df = (3*y0-4*y_1+y_2)/(2*h) %3点后差

%验证代码
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
% title('y=sin(x)的导函数');
% xlabel('x');
% ylabel('y');
% legend('前差','中心差','原函数','导数函数');
