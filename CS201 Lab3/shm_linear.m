function dydt = shm_linear(t,u)

k = 2;
m = 5;

dydt = zeros(length(u),1);
dydt(1) = u(2);
dydt(2) = -(k/m)*u(1);