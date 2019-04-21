clc;
clear all;
close all;

Ex = 0;
Ey = 10;
Ez = 10;
E = [Ex Ey Ez];

Bx = 1;
By = 0;
Bz = 0;
B = [Bx By Bz];

ux = 0;
uy = 0;
uz = 0;
u = [ux uy uz];

x0 = 0;
y0 = 0;
z0 = 0;
r0 = [x0 y0 z0];

t0 = 0;
tf = 2;
dt = 0.01;
tspan = t0 : dt : tf;

p0 = [x0;y0;z0;ux;uy;uz;Bx;By;Bz;Ex;Ey;Ez];

[t,p] = ode45(@A1Lorentz,tspan,p0);

plot3(p(:,1),p(:,2),p(:,3));