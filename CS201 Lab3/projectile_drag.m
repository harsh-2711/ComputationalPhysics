function dydt = projectile_drag(t,u) % left name - to be used in current file, right name - global name to be used in other files

g = 9.8;
R = 6400000;
Bbym = 0.00004;
y0 = 1000; % Default altitude
theta = 30;
% Fdrag = exp(-y/y0) * -B2 * v^2

dydt = zeros(length(u),1); % initialize with same length

dydt(1) = u(3);
dydt(2) = u(4);
dydt(3) = -Bbym*cos(theta)*(u(3)*u(3)) * exp(-(u(2))/y0);
dydt(4) = g * (1-2*u(2)/R) - Bbym*sin(theta)*(u(4)*u(4)) * exp(-(u(2))/y0);
 
end
