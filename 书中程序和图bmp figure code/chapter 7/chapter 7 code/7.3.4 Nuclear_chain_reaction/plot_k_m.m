
%%%%%%%%% piot_k_m %%%%%%

z=load('k_m.txt');
x=z(:,1);
y=z(:,2);
plot(x,y,'ro');
grid on;
xlabel('M');
ylabel('k');
title('裂变倍增系数与质量之间关系');




