clc;
clear all;

visc_honey = 10;
r = 0.1;
m = 10;

dt = 0.1;
g = 9.8;
V = (4/3) * pi * r.^3;
dens_honey = 1.45;
dens_ball = m / V;

num_steps = 5;

t = zeros(num_steps,1);
x = zeros(num_steps,1);
v = zeros(num_steps,1);

for step = 1:1:num_steps/dt
   t(step+1) = t(step) + dt;
   x(step+1) = x(step) + v(step)*dt;
   v(step+1) = v(step) + g*dt - (dt*6*pi*r*v(step)*visc_honey)/m;
end

plot(t,x,'r-',t,v,'b-');