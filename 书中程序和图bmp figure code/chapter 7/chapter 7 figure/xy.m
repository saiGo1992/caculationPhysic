

% 画坐标系程序
function xy(xmin,xmax,ymin,ymax)
dx = (xmax-xmin)/15; dy = (ymax-ymin)/15;
plot([xmin xmax],[0 0],'k','Linewidth',1);      % 画x轴
hold on;
ddy = 0.2
plot([0 0],[0 ymax+ddy],'k','Linewidth',1);      % 画y轴
AXIS(AXIS);
ARROW([xmax  0],[xmax+dx 0]); % 画x轴箭头
text(xmax,-dy,'x','FontName','Times New Roman','FontSize',16); % 写x轴表示
ARROW([0 ymax+ddy],[0 ymax+ddy+dy]);  % 画y轴箭头
text(-dx,ymax+ddy,'y','FontName','Times New Roman','FontSize',16); % 写y轴表示
axis('square');
axis off;
