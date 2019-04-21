clc;
close all;
clear all;

global E mass_earth initial_tangential_velocity radius_around_sun l mass_sun G;

E = -2.624e33;
G = 6.67e-11;

mass_earth = 5.972e24;
mass_sun = 1.989e30;

radius_around_sun = 1.49e9;

initial_tangential_velocity = sqrt((G * mass_sun) / (radius_around_sun));
l = mass_earth * (radius_around_sun ^ 2) * initial_tangential_velocity;

initial_radius = radius_around_sun;
initial_angle = 0;
u0 = [initial_radius initial_angle];
dt = 0.0001;
T = 0:dt:1;

[t, u] = ode45(@orbits, T, u0); 

x = u(:, 1) .* cos(u(:, 2));
y = u(:, 1) .* sin(u(:, 2));

figure(1)
plot(x, y);
xlabel('x(m)'),ylabel('y(m)');
title('Motion when dt=0.0001')