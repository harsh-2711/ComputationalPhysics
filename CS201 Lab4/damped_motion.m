function dydt = damped_motion(t,u,m,k,b,F0,w)

dydt = zeros(length(u),1);
dydt(1) = u(2);
dydt(2) = -((k*u(1))/m + (b*u(2))/m) + F0*cos(w*t);

end