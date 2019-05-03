z=load('k_m.txt');
x=z(:,1);
y=z(:,2);
figure(1);
set(gca,'FontSize',16);
plot(x,y,'ro');
grid on;
xlabel('M');
ylabel('k');
%title('图7.3-7  裂变倍增系数与质量之间关系');




