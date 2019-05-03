%%%%%%  buffon_1.m %%%%%%%
% ∆—∑·Õ∂’Îº∆À„pi
clc;clear; format long;
a = 45.; l = 36.; n = 5000;
x = []; phi = [];
for i=1:n
    w1 = 0.5*a*rand();
    w2 = pi*rand();
    if(w1<=0.5*l*sin(w2))
        x = [x,w1]; phi = [phi,w2];
    end
end
m = length(x); 
pai=2.*l*n/(a*m);
t = 0:0.01:pi
figure(1);
set(gca,'FontSize',16);
 plot(t,l*sin(t)/2);
 hold on;
 plot(phi,x,'.m');
 hold off;
 xlabel('\phi');
ylabel('x');
title('Õº7.3-10  ∆—∑·Õ∂’Îº∆À„\pi ÷µ');



