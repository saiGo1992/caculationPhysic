% ������ϵ����
function [xp,yp]=xy_change(x,y,xmin,xmax,ymin,ymax)
xp = (x-xmin)/(xmax-xmin);  % ע��latex��textλ�����������,����ԭ�������½�
yp = (y-ymin)/(ymax-ymin);  % xp.yp��Χ[0 1]*[0 1]
end



