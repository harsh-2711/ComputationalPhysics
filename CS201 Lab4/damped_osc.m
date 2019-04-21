function dydt = damped_osc(t,u,m,k,b)

dydt = zeros(length(u),1);
dydt(1) = u(2);
%dydt(2) = -((g * u(1)) / l) + ((k * u(1)) / m);
dydt(2) = -((b*u(1))/m + (k*u(2))/m);

end