function dydt = shm_linear(t,u)

k = 1;
m = 1;

dydt = zeros(length(u),1);
dydt(1) = u(2);
dydt(2) = -(k/m)*u(1);

end