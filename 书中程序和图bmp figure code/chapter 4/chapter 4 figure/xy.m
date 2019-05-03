

% ������ϵ����
function xy(xmin,xmax,ymin,ymax)
dx = (xmax-xmin)/15; dy = (ymax-ymin)/15;
plot([xmin xmax],[0 0],'k','Linewidth',1);      % ��x��
hold on;
plot([0 0],[ymin ymax],'k','Linewidth',1);      % ��y��
AXIS(AXIS);
ARROW([xmax  0],[xmax+dx 0]); % ��x���ͷ
text(xmax,-dy,'x','FontName','Times New Roman','FontSize',16); % дx���ʾ
ARROW([0 ymax],[0 ymax+dy]);  % ��y���ͷ
text(-dx,ymax,'y','FontName','Times New Roman','FontSize',16); % дy���ʾ
axis('square');
axis off;
