% 画坐标系程序
function [xp,yp]=xy_change(x,y,xmin,xmax,ymin,ymax)
xp = (x-xmin)/(xmax-xmin);  % 注意latex的text位置是相对坐标,坐标原点在左下角
yp = (y-ymin)/(ymax-ymin);  % xp.yp范围[0 1]*[0 1]
end



