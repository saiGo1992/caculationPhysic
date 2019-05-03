% pi的计算(例题7.3.4）
clc;clear; format long;
i=1;count=0.;
n = 5000;
x = rand(n,1);
y = rand(n,1);
figure(1);
set(gca,'FontSize',16);
for i=1:n
  if (x(i)*x(i)+y(i)*y(i))<=1.0
     plot(x(i),y(i),'r.');
     count=count+1.;
  else
    hold on;
    plot(x(i),y(i),'b.');  
  end
end
pi_val = 4.*count/(i-1)
xlabel('x');
ylabel('y');
%title('图7.3-2  计算\pi 值示意图');


