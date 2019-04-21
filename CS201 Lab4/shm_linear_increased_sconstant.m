function dydt = shm_linear_increased_sconstant(t,u)

k = 10;
m = 1;

dydt = zeros(length(u),1);
dydt(1) = u(2);
dydt(2) = -(k/m)*u(1);

end