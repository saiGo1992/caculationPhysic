function trap(a,b,M) 
%梯形公式 
%Input   f is the function 
%        a,b是积分下限与上限 
%        M是f的二阶导在(a,b)间的最大值  
%Output    
%         T 求积值 
syms x; 
f=input('f='); 
T=(b-a)*(subs(f,x,a)+subs(f,x,b))/2; 
R=M*(b-a)^3/12; 
fprintf('T=%12.6f\n',T); 
fprintf('R=%12.6f',R);

