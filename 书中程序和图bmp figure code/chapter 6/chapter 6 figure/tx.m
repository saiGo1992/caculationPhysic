% ������ϵ����
function tx(xmin,xmax,ymin,ymax)
dx = (xmax-xmin)/15; dy = (ymax-ymin)/15;
plot([xmin xmax],[0 0],'k','Linewidth',1);      % ��x��
hold on;
plot([0 0],[ymin ymax],'k','Linewidth',1);      % ��y��
AXIS(AXIS);
ARROW([xmax  0],[xmax+dx 0]); % ��x���ͷ
ARROW([0 ymax],[0 ymax+dy]);  % ��y���ͷ
xlabel_str = '$x$';
ylabel_str = '$t$';
xp = (-dx-xmin)/(xmax-xmin);
yp = (dy/2-ymin)/(ymax-ymin); % ע��xlabel��λ��
text('string',xlabel_str,...
    'Interpreter','latex',...
    'FontSize',16,...
    'units','norm',...
    'position',[1 yp]);
text('string',ylabel_str,...
    'Interpreter','latex',...
    'FontSize',16,...
    'units','norm',...
    'position',[xp 1]);
axis('square');
axis off;


