function dydt = projectile(t,u) % left name - to be used in current file, right name - global name to be used in other files

g = 9.8;
R = 6400000;

dydt = zeros(length(u),1); % initialize with same length

dydt(1) = u(3);
dydt(2) = u(4);
dydt(3) = 0;
dydt(4) = g * (1-2*u(2)/R);
 
end
