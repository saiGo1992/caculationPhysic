% function dy=pendulum(x,y)
%   %���ڲ���
%   g=9.98;
%   l=0.3;
%   dy=[y(2);-g/l*sin(y(1))];
% %   dy=[y(2);-g/l*y(1)];%С�ǶȽ���
% end

function dy=pendulum(x,y)
          %���ڲ���
  g=9.98;
  l=0.3;
  dy=[y(2);-g/l*sin(y(1))];
%   dy=[y(2);-g/l*y(1)];%С�ǶȽ���
end
