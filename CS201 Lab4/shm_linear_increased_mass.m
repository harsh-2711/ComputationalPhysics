function dydt = shm_linear_increased_mass(t,u)

k = 1;
m = 10;

dydt = zeros(length(u),1);
dydt(1) = u(2);
dydt(2) = -(k/m)*u(1);

end