

% 画坐标系程序
function xy(xmin,xmax,ymin,ymax)
dx = (xmax-xmin)/15; dy = (ymax-ymin)/15;
plot([xmin xmax],[0 0],'k','Linewidth',1);      % 画x轴
hold on;
plot([0 0],[ymin ymax],'k','Linewidth',1);      % 画y轴
AXIS(AXIS);
ARROW([xmax  0],[xmax+dx 0]); % 画x轴箭头
text(xmax,-dy,'x','FontName','Times New Roman','FontSize',16); % 写x轴表示
ARROW([0 ymax],[0 ymax+dy]);  % 画y轴箭头
text(-dx,ymax,'y','FontName','Times New Roman','FontSize',16); % 写y轴表示
axis('square');
axis off;
