% function dy=pendulum(x,y)
%   %单摆参数
%   g=9.98;
%   l=0.3;
%   dy=[y(2);-g/l*sin(y(1))];
% %   dy=[y(2);-g/l*y(1)];%小角度近似
% end

function dy=pendulum(x,y)
          %单摆参数
  g=9.98;
  l=0.3;
  dy=[y(2);-g/l*sin(y(1))];
%   dy=[y(2);-g/l*y(1)];%小角度近似
end
