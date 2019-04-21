function dydt = projectile_diff(t,u)

dydt = zeros(length(u),1); % initialize with same length

g = 9.8;

dydt(1) = u(3);
dydt(2) = u(4);
dydt(3) = 0;
dydt(4) = -g;

end