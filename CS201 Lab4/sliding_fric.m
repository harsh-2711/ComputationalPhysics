function dydt = sliding_fric(t,u,m,k,b)

dydt = zeros(length(u),1);
dydt(1) = u(2);

if u(1) < 0
    dydt(2) = (-k*u(1))/m + b;
else
    dydt(2) = (-k*u(1))/m - b;
end

end