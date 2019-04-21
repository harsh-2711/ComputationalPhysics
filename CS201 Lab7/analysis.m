function dydt = analysis(t, initial, r)

dydt = zeros(length(initial), 1);
dydt(1) = initial(3);
dydt(2) = initial(4);
dydt(3) = -((4 * pi * pi) * initial(1)) / (r * r * r);
dydt(4) = -((4 * pi * pi) * initial(2)) / (r * r * r);