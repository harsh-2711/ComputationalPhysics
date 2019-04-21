function dydt = cycle(t,u)

dydt = zeros(length(u),1);

P = 200; % Watts
C = 0.5;
D = 1.225;
A = 0.3;
m = 75;

dydt(1) = (P/(m*u(1))) - ((C*D*A*u(1)*u(1))/m);