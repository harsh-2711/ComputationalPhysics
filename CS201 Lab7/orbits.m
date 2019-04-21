function dydt = orbits(t, initial)
global mass_earth mass_sun l E G;

dydt = zeros(length(initial),1);

potential = (G * mass_earth * mass_sun) / initial(1);
dydt(1) = -sqrt(((2 / mass_earth) * (E + potential)) - ((l/(mass_earth * initial(1)) ^ 2)));
dydt(2) = l / (mass_earth * initial(1) * initial(1));