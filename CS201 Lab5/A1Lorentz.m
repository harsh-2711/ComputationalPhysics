function f = A1Lorentz(t,p)

f = zeros(length(p),1);

q = 1.6;
m = 9.1;
k = q / m;

% Position
f(1) = p(4);
f(2) = p(5);
f(3) = p(6);

% Velocity
f(4) = k * (p(10) + (p(5) * p(9)) - (p(6) * p(8)));
f(5) = k * (p(11) + (p(6) * p(7)) - (p(4) * p(9)));
f(6) = k * (p(12) + (p(4) * p(8)) - (p(5) * p(7)));

% Magnetic
f(7) = 0;
f(8) = 0;
f(9) = 0;

% Electric
f(10) = 0;
f(11) = 0;
f(12) = 0;

end