function trap(a,b,M) 
%���ι�ʽ 
%Input   f is the function 
%        a,b�ǻ������������� 
%        M��f�Ķ��׵���(a,b)������ֵ  
%Output    
%         T ���ֵ 
syms x; 
f=input('f='); 
T=(b-a)*(subs(f,x,a)+subs(f,x,b))/2; 
R=M*(b-a)^3/12; 
fprintf('T=%12.6f\n',T); 
fprintf('R=%12.6f',R);

